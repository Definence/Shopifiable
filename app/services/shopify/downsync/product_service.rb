module Shopify
  class Downsync::ProductService
    include Storefront::BaseHelper
    include Storefront::ProductsHelper
    include Shopify::ShopHelper

    def initialize(handle, local_shop)
      @remote_product = define_remote_product(handle)
      @local_shop = define_local_shop(local_shop)
      different_currencies = price_range.min_variant_price.currency_code != price_range.max_variant_price.currency_code
      raise 'Different currencies are not supported' if different_currencies
    end

    def call
      ActiveRecord::Base.transaction do
        assign_product_attrs!
        assign_collections!
        assign_images!
        assign_variants!
      end

      local_product
    end

    private

    def assign_product_attrs!
      local_product.assign_attributes(local_product_attrs)
      local_product.save!
    end

    def assign_images!
      local_product.images.destroy_all
      images = @remote_product.images.edges.map { |i| local_product.images.new(ext_url: i.node.src) }
      Image.import! images
    end

    def assign_collections!
      local_product.collections.clear
      collections = @remote_product.collections.edges.map do |rc|
        local_collection = Shop::Collection.find_by(handle: rc.node.handle)
        local_collection.presence || Shop::Collection.downsync!(rc.node.handle, @local_shop)
      end

      local_product.collections << collections
    end

    def assign_variants!
      local_product.variants.destroy_all
      variants = @remote_product.variants.edges.map do |rv|
        local_product.variants.new(guid: rv.node.id, title: rv.node.title, price: rv.node.price.to_f)
      end

      Shop::Product::Variant.import! variants
    end

    def local_product
      @local_product ||= define_local_product
    end

    def price_range
      @remote_product.price_range
    end

    def define_local_product
      Shop::Product.find_or_initialize_by(handle: @remote_product.handle)
    end

    def define_remote_product handle
      remote_product = if handle.is_a? String
        client.query(get_product, { handle: handle }).data.product_by_handle
      else
        handle
      end
    end

    def local_product_attrs
      {
        shop_id: @local_shop.id,
        guid: @remote_product.id,
        description_html: @remote_product.description_html,
        product_type: @remote_product.product_type,
        tags: @remote_product.tags,
        title: @remote_product.title,
        currency: price_range.min_variant_price.currency_code,
        min_price: price_range.min_variant_price.amount.to_f,
        max_price: price_range.max_variant_price.amount.to_f,
      }
    end
  end
end

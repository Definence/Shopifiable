module Shopify
  class Downsync::ProductService
    include Storefront::BaseHelper
    include Storefront::ProductsHelper
    include Shopify::ShopHelper
    include MoneyHelper

    def initialize(handle, local_shop)
      @remote_product = define_remote_product(handle)
      @local_shop = define_local_shop(local_shop)
      different_currencies = price_range.min_variant_price.currency_code != price_range.max_variant_price.currency_code
      raise 'Different currencies are not supported' if different_currencies
    end

    def call # TODO refactor & add variants
      assign_collections!
      assign_images!
    end

    private

    def assign_images
      Image.transaction do
        local_product.images.destroy_all
        images = @remote_product.images.edges.map { |i| local_product.images.new(ext_url: i.node.src) }
        Image.import! images
      end
    end

    def assign_collections
      ActiveRecord::Base.transaction do
        local_product.collections.clear
        local_collections = @remote_product.collections.edges.map do |rc|
          Shop::Collection.find_by(handle: rc.node.handle)
        end
        local_product.collections << local_collections
      end
    end

    def local_product
      @local_product ||= define_local_product
    end

    def price_range
      @remote_product.price_range
    end

    def define_local_product
      local_product = Shop::Product.find_or_initialize_by(handle: @remote_product.handle)
      local_product.assign_attributes(local_product_attrs)
      local_product.save!
      local_product
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

module Shopify
  class Downsync::Shop::ProductService
    include Storefront::BaseHelper
    include Storefront::ProductsHelper
    include MoneyHelper

    def initialize(handle, local_shop)
      @handle = handle
      @local_shop = local_shop
      @price_range = remote_product.price_range
      different_currencies = @price_range.min_variant_price.currency_code != @price_range.max_variant_price.currency_code
      raise 'Different currencies are not supported' if different_currencies
    end

    def call # TODO refactor & add variants
      local_product.collections.clear
      local_collections = remote_product.collections.edges.map do |rc|
        Shop::Collection.find_by(handle: rc.node.handle)
      end
      local_product.collections << local_collections

      images = remote_product.images.edges.map do |i|
        next if local_product.images.find_by(ext_url: i.node.src)
        local_product.images.new(ext_url: i.node.src)
      end
      Image.import! images.compact
    end

    private

    def local_product
      @local_product ||= define_local_product
    end

    def remote_product
      @remote_product ||= client.query(get_product, { handle: @handle }).data.product_by_handle
    end

    def define_local_product
      local_product = Shop::Product.find_or_initialize_by(handle: remote_product.handle)
      local_product.assign_attributes(local_product_attrs)
      local_product.save!
      local_product
    end

    def local_product_attrs
      {
        shop_id: @local_shop.id,
        guid: remote_product.id,
        description_html: remote_product.description_html,
        product_type: remote_product.product_type,
        tags: remote_product.tags,
        title: remote_product.title,
        currency: @price_range.min_variant_price.currency_code,
        min_price: @price_range.min_variant_price.amount.to_f,
        max_price: @price_range.max_variant_price.amount.to_f,
      }
    end
  end
end

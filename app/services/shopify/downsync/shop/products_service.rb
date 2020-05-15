module Shopify
  class Downsync::Shop::ProductsService
    include Storefront::BaseHelper
    include Storefront::ProductsHelper

    def initialize(local_shop)
      @local_shop = local_shop
    end

    def call
      remote_products.each do |rp|
        Shop::Product.downsync!(rp.node.handle, @local_shop)
      end
    end

    private

    def remote_products
      @remote_products ||= client.query(get_products).data.products.edges
    end
  end
end

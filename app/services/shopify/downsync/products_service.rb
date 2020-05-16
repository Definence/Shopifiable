module Shopify
  class Downsync::ProductsService
    include Storefront::BaseHelper
    include Storefront::ProductsHelper
    include Shopify::ShopHelper

    def initialize(local_shop)
      @local_shop = define_local_shop(local_shop)
    end

    def call
      remote_products.each do |rp|
        Shop::Product.downsync!(rp.node, @local_shop)
      end
    end

    private

    def remote_products
      @remote_products ||= client.query(get_products).data.products.edges
    end
  end
end

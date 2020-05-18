module Shopify
  class Downsync::CollectionsService
    include Storefront::CollectionsHelper
    include ShopHelper

    def initialize(local_shop)
      @local_shop = define_local_shop(local_shop)
      @local_shop.activate_session!
    end

    def call
      remote_collections.each do |rc|
        Shop::Collection.downsync!(rc, @local_shop)
      end
    end

    private

    def remote_collections
      @collections ||= ShopifyAPI::SmartCollection.find(:all)
    end
  end
end

module Shopify
  class Downsync::CollectionService
    include ShopHelper

    def initialize(handle, local_shop)
      @local_shop = define_local_shop(local_shop)
      @local_shop.activate_session!
      @remote_collection = define_remote_collection(handle)
    end

    def call
      rules = @remote_collection.rules.map do |rr|
        next if local_collection.rules.detect { |lr| lr.column === rr.column && lr.relation === rr.relation && lr.condition === rr.condition }
        { column: rr.column, relation: rr.relation, condition: rr.condition, collection_id: local_collection.id }
      end

      Shop::Collection::Rule.import! rules.compact
      local_collection
    end

    private

    def define_remote_collection handle
      if handle.is_a? ShopifyAPI::SmartCollection
        handle
      else
        remote_collections.detect{ |rc| rc.handle ===  handle }
      end
    end

    def local_collection
      @local_collection ||= Shop::Collection.create_with(
        title: @remote_collection.title
      ).find_or_create_by!(handle: @remote_collection.handle)
    end

    def remote_collections
      @collections ||= ShopifyAPI::SmartCollection.find(:all)
    end
  end
end

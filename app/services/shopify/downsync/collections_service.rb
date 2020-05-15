class Shopify::Downsync::CollectionsService
  def initialize(local_shop)
    @local_shop = local_shop
    @remote_shop = local_shop.activate_session!
  end

  def call
    remote_collections.each do |rc|
      local_collection = Shop::Collection.create_with(title: rc.title).find_or_create_by!(handle: rc.handle)
      remote_rules = rc.rules
      local_rules = local_collection.rules

      rules = remote_rules.map do |rr|
        next if local_rules.detect { |lr| lr.column === rr.column && lr.relation === rr.relation && lr.condition === rr.condition }
        { column: rr.column, relation: rr.relation, condition: rr.condition, collection_id: local_collection.id }
      end

      Shop::Collection::Rule.import! rules.compact
    end
  end

  private

  def remote_collections
    @collections ||= ShopifyAPI::SmartCollection.find(:all)
  end
end

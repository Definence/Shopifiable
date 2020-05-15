module WithCollections
  include ActiveSupport::Concern

  private

  def define_collections
    @collections = Shop::Collection.all.map { |c|
      next unless c.primary?

      { title: c.title, handle: c.handle, types: sub_collections(c) }
    }.compact
  end

  def sub_collections collection
    collection.rules.map { |r|
      is_product_type = r.column === 'type' && r.relation === 'equals'
      r.condition if is_product_type
    }.uniq.compact
  end
end

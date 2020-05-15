module WithCollections
  include ActiveSupport::Concern

  private

  def define_collections
    @collections = [] # TODO define collections
    # @collections ||= ShopifyAPI::SmartCollection.find(:all).map { |c|
    #   is_primary = c.respond_to? :image
    #   next unless is_primary

    #   types = c.rules.map do |c|
    #     is_product_type = c.attributes['column'] === 'type' && c.attributes['relation'] === 'equals'
    #     c.attributes['condition'] if is_product_type
    #   end

    #   { title: c.title, handle: c.handle, types: types.uniq.reject { |i| i.blank? } }
    # }.reject { |i| i.blank? }
  end
end

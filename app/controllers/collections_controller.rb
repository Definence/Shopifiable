class CollectionsController < ApplicationController
  def show
    @smart_collection = ShopifyAPI::SmartCollection.where(handle: params[:collection_type])&.first
    return head 404 if @smart_collection.blank?

    @products = @smart_collection.products
    render layout: 'embedded_app'
  end
end

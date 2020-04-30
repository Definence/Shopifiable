class CollectionsController < ApplicationController
  def show
    @smart_collection = ShopifyAPI::SmartCollection.where(title: params[:type])&.first
    return head 404 if @smart_collection.blank?

    @products = @smart_collection.products
  end
end

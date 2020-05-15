class CollectionsController < ApplicationController
  def show
    # variables = { handle: params[:type] }
    # response = storefront.query(collection_by_handle, variables)
    # @collection = response.data.collection_by_handle
    # return head 404 if @collection.blank?

    # @products = @collection.products.edges
    @products = []
    @collection = Struct.new
  end
end

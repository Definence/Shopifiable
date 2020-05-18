class CollectionsController < ApplicationController
  def show
    @collection = Shop::Collection.find_by!(handle: params[:type])
    @products = @collection.products
  end
end

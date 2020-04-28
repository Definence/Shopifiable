class Collections::ProductsController < ApplicationController
  def show
    @product = ShopifyAPI::Product.find(params[:guid])
    @sizes = @product.variants.map { |v| { value: v.id, label: v.title } }
    head 404 if @product.blank?
  end
end

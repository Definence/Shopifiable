class Collections::ProductsController < ApplicationController
  def show
    @product = Shop::Product.find_by!(guid: params[:guid])
    @variants = @product.variants.map { |v| { value: v.guid, label: v.title, price: v.price } }
  end
end

class CartItemsController < ApplicationController
  def create
    p '@@@'
    p cart_item_params
    p '@@@'
  end

  private

  def cart_item_params
    params.require(:item).permit(:quantity, :id)
  end
end

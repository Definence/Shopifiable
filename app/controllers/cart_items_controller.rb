class CartItemsController < ApplicationController
  def create
    return head 422 if item_params[:quantity].blank? || item_params[:id].blank?

    binding.pry
    shopify_client.add_cart({id: 32108603244641, quantity: 1})
  end

  private

  def item_params
    params.require(:item).permit(:quantity, :id)
  end
end

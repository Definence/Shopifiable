class CartItemsController < ApplicationController
  def create
    return head 422 if item_params[:quantity].blank? || item_params[:id].blank?

    params = { id: item_params[:id], quantity: item_params[:quantity] }
    # response = RestClient.post(url, params)
    binding.pry
  end

  private

  def item_params
    params.require(:item).permit(:quantity, :id)
  end
end

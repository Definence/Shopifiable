class Checkouts::LineItemsController < ApplicationController
  def create
    # p @checkout.line_items << ShopifyAPI::LineItem.new(line_item_params)
    # q = ShopifyAPI::Checkout.new(line_items: [ShopifyAPI::LineItem.new(line_item_params)])
  end

  private

  def line_item_params
    params.require(:line_item).permit(:variant_id, :quantity)
  end
end

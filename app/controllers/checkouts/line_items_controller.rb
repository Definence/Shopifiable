class Checkouts::LineItemsController < ApplicationController
  def create
    checkout_id = request.cookies['checkout_id']

    binding.pry

    # response = storefront.query do
    #   mutation do
    #     checkoutLineItemsReplace(checkoutId: checkout_id, lineItems: []) do
    #     # checkoutLineItemsReplace(checkoutId: checkout_id, lineItems: [{ variantId: line_item_params[:variant_id], quantity: line_item_params[:quantity] }]) do
    #       checkout {
    #         id
    #       }
    #     end
    #   end
    # end

    # query = <<-GRAPHQL
    #   mutation($checkoutId: ID!, $lineItems: [CheckoutLineItemInput!]!) {
    #     checkoutLineItemsReplace(checkoutId: $checkoutId, lineItems: $lineItems) {
    #       checkout {
    #         id
    #       }
    #     }
    #   }
    # GRAPHQL

    # variables = { checkoutId: "gid://shopify/Checkout/#{checkout_id}", lineItems: [{ quantity: line_item_params[:quantity].to_i, variantId: line_item_params[:variant_id] }] }

    # query = <<-GRAPHQL
    #   mutation($lineItems: [CheckoutLineItemInput!]!) {
    #     checkoutCreate(input: { lineItems: $lineItems }) {
    #       checkout {
    #         id
    #       }
    #     }
    #   }
    # GRAPHQL

    # variables = { lineItems: [{ quantity: line_item_params[:quantity].to_i, variantId: line_item_params[:variant_id] }] }
    # response = storefront.query(query, variables)

    query = <<-GRAPHQL
      query {
        products(first:5, query:"collection_type:smart"){
          edges{
            node{
              id
            }
          }
        }
      }
    GRAPHQL

    response = storefront.query(query)


    # p @checkout.line_items << ShopifyAPI::LineItem.new(line_item_params)
    # q = ShopifyAPI::Checkout.new(line_items: [ShopifyAPI::LineItem.new(line_item_params)])
  end

  private

  def line_item_params
    params.require(:line_item).permit(:variant_id, :quantity)
  end
end

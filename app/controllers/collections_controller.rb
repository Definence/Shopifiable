class CollectionsController < ApplicationController
  def show
    query = <<-GRAPHQL
      query($handle: String!) {
        collectionByHandle(handle: $handle) {
          id
          handle
          products(first: 50) {
            edges {
              node {
                id
                title
                priceRange {
                  minVariantPrice {
                    amount
                    currencyCode
                  }
                  maxVariantPrice {
                    amount
                    currencyCode
                  }
                }
                variants(first: 200) {
                  edges {
                    node {
                      price
                    }
                  }
                }
                images(first: 2) {
                  edges {
                    node {
                      src
                    }
                  }
                }
              }
            }
          }
        }
      }
    GRAPHQL

    variables = { handle: params[:type] }
    response = storefront.query(query, variables)
    @collection = response.data.collection_by_handle
    return head 404 if @collection.blank?

    @products = @collection.products.edges
  end
end

module Shopify::Storefront::CollectionsHelper
  def get_collection
    <<~GRAPHQL
      query($handle: String!) {
        collectionByHandle(handle: $handle) {
          handle
          title
          rules(first: 250) {
            edges {
              node {
                column
                relation
                condition
              }
            }
          }
        }
      }
    GRAPHQL
  end
end

module CollectionsHelper # TODO check if needed
  def collection_by_handle
    <<~GRAPHQL
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
  end
end

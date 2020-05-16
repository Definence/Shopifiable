module Shopify::Storefront::ProductsHelper
  def get_products # TODO add bulk fetching
    <<~GRAPHQL
      query {
        products(first: 250) {
          edges {
            node {
              id
              descriptionHtml
              handle
              productType
              tags
              title
              collections(first: 250) {
                edges {
                  node {
                    handle
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
            }
          }
        }
      }
    GRAPHQL
  end

  def get_product
    <<~GRAPHQL
      query($handle: String!) {
        productByHandle(handle: $handle) {
          id
          descriptionHtml
          handle
          productType
          tags
          title
          collections(first: 250) {
            edges {
              node {
                handle
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
        }
      }
    GRAPHQL
  end
end

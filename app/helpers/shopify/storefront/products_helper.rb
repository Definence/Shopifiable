module Shopify::Storefront::ProductsHelper
  def get_products # TODO add bulk fetching
    <<~GRAPHQL
      query {
        products(first: 250) {
          edges { node { #{product} } }
        }
      }
    GRAPHQL
  end

  def get_product
    <<~GRAPHQL
      query($handle: String!) {
        productByHandle(handle: $handle) { #{product} }
      }
    GRAPHQL
  end

  private

  def product
    <<-PRODUCT
      id descriptionHtml handle productType tags title
      collections(first: 250) {
        edges { node { handle } }
      }
      images(first: 2) {
        edges { node { src } }
      }
      variants(first: 250) {
        edges { node { id title price } }
      }
      priceRange {
        minVariantPrice { amount currencyCode }
        maxVariantPrice { amount currencyCode }
      }
    PRODUCT
  end
end

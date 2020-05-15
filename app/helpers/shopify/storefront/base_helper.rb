module Shopify::Storefront::BaseHelper
  def client
    @client ||= create_client
  end

  private

  def create_client
    storefront_token = @local_shop.shopify_storefront_token
    api_version = @local_shop.api_version
    domain = @local_shop.shopify_domain
    return if storefront_token.blank?

    Graphlient::Client.new("https://#{domain}/api/#{api_version}/graphql",
      headers: {
        'X-Shopify-Storefront-Access-Token' => storefront_token,
        'Accept' => 'application/json'
      },
      http_options: {
        read_timeout: 20,
        write_timeout: 30
      }
    )
  end
end

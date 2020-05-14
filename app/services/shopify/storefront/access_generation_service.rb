class Shopify::Storefront::AccessGenerationService
  UNAUTHORIZED_SCOPES = 'unauthenticated_read_content,unauthenticated_read_customer_tags,unauthenticated_read_product_tags,unauthenticated_read_product_listings,unauthenticated_write_checkouts,unauthenticated_read_checkouts,unauthenticated_write_customers,unauthenticated_read_customers'

  def initialize(args)
    @local_shop = Shop.find(args[:id])
    @remote_shop = activate_session
  end

  def call
    token = ShopifyAPI::StorefrontAccessToken.create(
      title: 'Shopifiable',
      # access_scope: UNAUTHORIZED_SCOPES
    ).access_token

    @local_shop.update(shopify_storefront_token: token)
  end

  private

  def activate_session
    session = ShopifyAPI::Session.new(domain: @local_shop.shopify_domain, token: @local_shop.shopify_token, api_version: @local_shop.api_version)
    ShopifyAPI::Base.activate_session(session)
    ShopifyAPI::Shop.current
  end
end

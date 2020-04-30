ShopifyApp.configure do |config|
  config.application_name = "Shopifiable"
  config.api_key = Rails.application.credentials.shopify_api_key
  config.secret = Rails.application.credentials.shopify_api_secret
  config.old_secret = ""

  # Consult this page for more scope options:
  # https://help.shopify.com/en/api/getting-started/authentication/oauth/scopes
  config.scope = "write_products, write_product_listings, write_customers, write_orders, write_inventory, write_shipping, write_checkouts, write_price_rules"

  config.embedded_app = false
  config.after_authenticate_job = false
  config.api_version = "2020-04"
  config.shop_session_repository = 'Shop'
end

# ShopifyApp::Utils.fetch_known_api_versions                        # Uncomment to fetch known api versions from shopify servers on boot
# ShopifyAPI::ApiVersion.version_lookup_mode = :raise_on_unknown    # Uncomment to raise an error if attempting to use an api version that was not previously known

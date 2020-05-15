class ApplicationController < ActionController::Base
  include WithCollections
  # include WithCheckouts

  # before_action :ensure_checkout
  before_action :define_collections

  def current_remote_shop
    @remote_shop ||= ShopifyAPI::Shop.current
  end

  def current_local_shop
    @local_shop ||= Shop.find_by(shopify_domain: current_remote_shop.domain)
  end

  def storefront # TODO deprecate
    # storefront_token = current_local_shop.shopify_storefront_token
    # api_version = current_local_shop.api_version
    # domain = current_local_shop.shopify_domain
    # return if storefront_token.blank?

    # @client ||= Graphlient::Client.new("https://#{domain}/api/#{api_version}/graphql",
    #   headers: {
    #     'X-Shopify-Storefront-Access-Token' => storefront_token,
    #     'Accept' => 'application/json'
    #   },
    #   http_options: {
    #     read_timeout: 20,
    #     write_timeout: 30
    #   }
    # )
  end

end

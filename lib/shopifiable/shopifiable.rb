$LOAD_PATH.unshift File.dirname(__FILE__)

require 'resources/cart'

module Shopifiable
  module Client
    def initialize(domain:)
      RestClient.log = 'stdout' if Rails.env.development?
      @domain = domain
    end

    def base_url
      api_key = Rails.application.credentials.shopify_api_key
      password = Rails.application.credentials.shopify_password
      @domain.include?('https://') ? @domain : "https://#{api_key}:#{password}@#{@domain}"
    end

    def request(url, method, params = {}, additional_headers = {})
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        # 'X-Shopify-Access-Token': ShopifyAPI::Session.send(:extract_current_session).token
      }.merge(additional_headers).merge(ShopifyAPI::Base.headers)

      RestClient.send(method, url, params.to_json, headers)
    end

  end
end

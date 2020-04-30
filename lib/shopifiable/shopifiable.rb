$LOAD_PATH.unshift File.dirname(__FILE__)

module Shopifiable
  module Client
    def base_url
      ShopifyAPI::Base.site
    end

    def request(url, method: :get, headers: {}, params: {})
      headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      }.merge(ShopifyAPI::Base.headers)

      RestClient::Request.execute(method: method, url: url, headers: headers, params: params)
    end
  end
end

require 'resources/base'
require 'resources/cart'

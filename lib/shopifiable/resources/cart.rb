module Shopifiable
  class Cart < Base
    class << self
      def index_endpoint
        'cart'
      end
    end
  # def add_cart(params)
  #   request("#{base_url}/cart/add", :post, params)
  # end
  end
end

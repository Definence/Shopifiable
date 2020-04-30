module Shopifiable
  class Base
    class << self
      include Client

      def all
        url = "#{base_url}/#{index_endpoint}"
        response = request url
        body = JSON.parse response.body
      end
    end
  end
end

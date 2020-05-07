class ApplicationController < ActionController::Base
  include ShopifyApp::Authenticated

  before_action :define_collections

  def define_collections
    @collections ||= ShopifyAPI::SmartCollection.find(:all).map do |collection|
      tags = []
      collection.products.map do |product|
        product_tags = product.tags.split(', ')
        tags.concat product_tags
      end

      { title: collection.title, tags: tags.uniq.reject { |c| c.empty? } }
    end
  end

  def shopify_client
    @shopify_client ||= Shopifiable::Client.new(domain: 'shopifiable-app.myshopify.com')
  end

  def current_shop
    @shop ||= ShopifyAPI::Shop.current
  end
end

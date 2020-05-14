# frozen_string_literal: true
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorage

  after_create :set_shopify_storefront_token, if: proc { self.shopify_storefront_token.blank? }

  def api_version
    ShopifyApp.configuration.api_version
  end

  def activate_session
    session = ShopifyAPI::Session.new(domain: shopify_domain, token: shopify_token, api_version: api_version)
    ShopifyAPI::Base.activate_session(session)
    ShopifyAPI::Shop.current
  end

  private

  def set_shopify_storefront_token
    Shopify::Storefront::AccessWorker.perform_in(1.minute, id: id)
  end
end

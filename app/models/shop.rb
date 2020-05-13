# frozen_string_literal: true
class Shop < ActiveRecord::Base
  include ShopifyApp::ShopSessionStorage

  after_create :set_shopify_storefront_token, if: proc { self.shopify_storefront_token.blank? }

  def api_version
    ShopifyApp.configuration.api_version
  end

  private

  def set_shopify_storefront_token
    Shopify::Storefront::AccessWorker.perform_in(1.minute, id: id)
  end
end

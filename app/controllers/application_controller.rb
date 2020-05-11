class ApplicationController < ActionController::Base
  include ShopifyApp::Authenticated
  include WithCollections
  include WithCheckouts

  before_action :ensure_checkout, :define_collections

  def current_shop
    @shop ||= ShopifyAPI::Shop.current
  end

end

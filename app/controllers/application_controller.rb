class ApplicationController < ActionController::Base
  include ShopifyApp::Authenticated

  before_action :define_collections

  def define_collections
    @collections ||= ShopifyAPI::SmartCollection.find(:all).map(&:handle)
  end
end

module WithCheckouts
  include ActiveSupport::Concern

  private

  def ensure_checkout
    if cookies[:checkout_id]
      @checkout ||= ShopifyAPI::Checkout.find cookies[:checkout_id]
    else
      @checkout ||= create_checkout
    end
  rescue
    @checkout ||= create_checkout
  end

  def create_checkout
    checkout = ShopifyAPI::Checkout.create
    cookies[:checkout_id] = checkout.id
    checkout
  end
end

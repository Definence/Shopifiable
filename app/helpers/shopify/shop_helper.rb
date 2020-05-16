module Shopify::ShopHelper

  private

  def define_local_shop local_shop
    if local_shop.is_a?(Shop)
      local_shop
    else
      local_shop_id = local_shop
      Shop.find(local_shop_id)
    end
  end
end

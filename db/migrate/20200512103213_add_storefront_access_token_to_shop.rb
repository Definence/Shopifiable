class AddStorefrontAccessTokenToShop < ActiveRecord::Migration[6.0]
  def change
    add_column :shops, :shopify_storefront_token, :string
  end
end

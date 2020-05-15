class CreateShopCollectionsProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_collections_products do |t|
      t.belongs_to :shop_products
      t.belongs_to :shop_collections
    end
  end
end

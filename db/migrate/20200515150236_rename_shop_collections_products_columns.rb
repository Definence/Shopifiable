class RenameShopCollectionsProductsColumns < ActiveRecord::Migration[6.0]
  def self.up
    rename_column :shop_collections_products, :shop_products_id, :product_id
    rename_column :shop_collections_products, :shop_collections_id, :collection_id
  end

  def self.down
    rename_column :shop_collections_products, :product_id, :shop_products_id
    rename_column :shop_collections_products, :collection_id, :shop_collections_id
  end
end

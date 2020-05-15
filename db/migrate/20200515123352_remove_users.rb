class RemoveUsers < ActiveRecord::Migration[6.0]
  def change
    drop_table :users
    add_index :shop_collections, :handle, unique: true
    add_index :shop_products, :guid, unique: true
  end
end

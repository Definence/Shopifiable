class AddShopCollections < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_collections do |t|
      t.string :title, null: false
      t.string :handle, null: false

      t.timestamps
    end
  end
end

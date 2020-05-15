class CreateShopProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_products do |t|
      t.belongs_to  :shop, null: false
      t.string      :guid, null: false
      t.string      :title, null: false
      t.string      :currency, null: false
      t.decimal     :min_price, precision: 8, scale: 2, null: false
      t.decimal     :max_price, precision: 8, scale: 2, null: false

      t.timestamps
    end
  end
end

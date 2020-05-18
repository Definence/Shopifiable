class CreateShopProductVariants < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_product_variants do |t|
      t.string :guid, null: false
      t.string :title, null: false
      t.float :price, null: false
      t.belongs_to :product, null: false

      t.timestamps
    end

    add_index :shop_product_variants, %i[guid product_id], unique: true
    add_index :shop_product_variants, %i[title product_id], unique: true
  end
end

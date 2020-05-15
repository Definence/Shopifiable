class CreateShopCollectionRules < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_collection_rules do |t|
      t.string :column, null: false
      t.string :relation, null: false
      t.string :condition, null: false
      t.belongs_to :collection, null: false

      t.timestamps
    end
  end
end

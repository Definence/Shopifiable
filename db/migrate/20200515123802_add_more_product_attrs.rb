class AddMoreProductAttrs < ActiveRecord::Migration[6.0]
  def change
    add_column :shop_products, :handle, :string, null: false
    add_column :shop_products, :product_type, :string
    add_column :shop_products, :description_html, :text
    add_column :shop_products, :tags, :text, array: true
  end
end

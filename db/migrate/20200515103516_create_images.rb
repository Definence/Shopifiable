class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.string :ext_url, null: false
      t.references :imageable, polymorphic: true, null: false
    end
  end
end

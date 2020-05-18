# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_16_122504) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "images", force: :cascade do |t|
    t.string "ext_url", null: false
    t.string "imageable_type", null: false
    t.bigint "imageable_id", null: false
    t.index ["imageable_type", "imageable_id"], name: "index_images_on_imageable_type_and_imageable_id"
  end

  create_table "shop_collection_rules", force: :cascade do |t|
    t.string "column", null: false
    t.string "relation", null: false
    t.string "condition", null: false
    t.bigint "collection_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["collection_id"], name: "index_shop_collection_rules_on_collection_id"
  end

  create_table "shop_collections", force: :cascade do |t|
    t.string "title", null: false
    t.string "handle", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["handle"], name: "index_shop_collections_on_handle", unique: true
  end

  create_table "shop_collections_products", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "collection_id"
    t.index ["collection_id"], name: "index_shop_collections_products_on_collection_id"
    t.index ["product_id"], name: "index_shop_collections_products_on_product_id"
  end

  create_table "shop_product_variants", force: :cascade do |t|
    t.string "guid", null: false
    t.string "title", null: false
    t.float "price", null: false
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["guid", "product_id"], name: "index_shop_product_variants_on_guid_and_product_id", unique: true
    t.index ["product_id"], name: "index_shop_product_variants_on_product_id"
    t.index ["title", "product_id"], name: "index_shop_product_variants_on_title_and_product_id", unique: true
  end

  create_table "shop_products", force: :cascade do |t|
    t.bigint "shop_id", null: false
    t.string "guid", null: false
    t.string "title", null: false
    t.string "currency", null: false
    t.decimal "min_price", precision: 8, scale: 2, null: false
    t.decimal "max_price", precision: 8, scale: 2, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "handle", null: false
    t.string "product_type"
    t.text "description_html"
    t.text "tags", array: true
    t.index ["guid"], name: "index_shop_products_on_guid", unique: true
    t.index ["shop_id"], name: "index_shop_products_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "shopify_domain", null: false
    t.string "shopify_token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "shopify_storefront_token"
    t.index ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true
  end

end

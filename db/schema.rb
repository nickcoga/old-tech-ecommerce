# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_05_16_004901) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "parent_category_id"
    t.index ["parent_category_id"], name: "index_categories_on_parent_category_id"
  end

  create_table "offers", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.datetime "started_at"
    t.datetime "ended_at"
    t.decimal "discount", precision: 5, scale: 2
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_offers_on_product_id"
  end

  create_table "product_stores", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "store_id", null: false
    t.integer "quantity"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_stores_on_product_id"
    t.index ["store_id"], name: "index_product_stores_on_store_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.decimal "unit_price", precision: 7, scale: 2
    t.string "brand"
    t.decimal "weight", precision: 5, scale: 2
    t.string "model"
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "address"
    t.string "url_address"
    t.integer "annex"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "categories", "categories", column: "parent_category_id"
  add_foreign_key "offers", "products"
  add_foreign_key "product_stores", "products"
  add_foreign_key "product_stores", "stores"
  add_foreign_key "products", "categories"
end

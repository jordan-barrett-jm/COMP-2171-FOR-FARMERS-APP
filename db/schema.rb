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

ActiveRecord::Schema.define(version: 2020_12_02_082137) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumers", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_consumers_on_user_id"
  end

  create_table "farmers", force: :cascade do |t|
    t.string "farm_name"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_farmers_on_user_id"
  end

  create_table "line_items", force: :cascade do |t|
    t.string "produce_id"
    t.integer "quantity"
    t.bigint "shopping_cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_line_items_on_order_id"
    t.index ["shopping_cart_id"], name: "index_line_items_on_shopping_cart_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "consumer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "note"
    t.integer "status", default: 0
  end

  create_table "produces", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.json "images"
    t.boolean "available", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "farmer_id", null: false
    t.index ["farmer_id"], name: "index_produces_on_farmer_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "consumer_id"
    t.bigint "farmer_id"
    t.index ["consumer_id"], name: "index_reviews_on_consumer_id"
    t.index ["farmer_id"], name: "index_reviews_on_farmer_id"
  end

  create_table "shopping_carts", force: :cascade do |t|
    t.bigint "consumer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["consumer_id"], name: "index_shopping_carts_on_consumer_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.string "address_line_1"
    t.string "address_line_2"
    t.string "city"
    t.string "parish"
    t.string "phone_number"
    t.integer "state", default: 0
    t.string "account_type"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.text "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "consumers", "users"
  add_foreign_key "farmers", "users"
  add_foreign_key "line_items", "orders"
  add_foreign_key "line_items", "shopping_carts"
  add_foreign_key "produces", "farmers"
  add_foreign_key "reviews", "consumers"
  add_foreign_key "reviews", "farmers"
  add_foreign_key "shopping_carts", "consumers"
end

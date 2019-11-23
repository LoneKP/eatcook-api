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

ActiveRecord::Schema.define(version: 2019_11_23_143256) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name"
    t.datetime "pickup_time"
    t.boolean "cook_provides_packaging"
    t.integer "amount"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "description"
    t.string "address"
    t.integer "zip"
    t.string "city"
    t.string "tags", default: [], array: true
    t.index ["user_id"], name: "index_meals_on_user_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "pickups", force: :cascade do |t|
    t.string "name"
    t.datetime "pickup_time"
    t.boolean "cook_provides_packaging"
    t.integer "order_amount"
    t.string "description"
    t.string "address"
    t.integer "zip"
    t.string "city"
    t.string "tags", default: [], array: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "meal_id", null: false
    t.bigint "order_id", null: false
    t.index ["meal_id"], name: "index_pickups_on_meal_id"
    t.index ["order_id"], name: "index_pickups_on_order_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "meals", "users"
  add_foreign_key "orders", "users"
  add_foreign_key "pickups", "meals"
  add_foreign_key "pickups", "orders"
end

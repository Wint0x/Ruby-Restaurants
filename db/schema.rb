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

ActiveRecord::Schema[7.1].define(version: 2024_04_29_062807) do
  create_table "bookings", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date", precision: nil, null: false
    t.integer "number_of_guests", null: false
    t.integer "table_id"
    t.index ["table_id"], name: "fk_bookings_restaurant_table"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "customers", primary_key: "customer_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "first_name", limit: 50, null: false
    t.string "last_name", limit: 50, null: false
    t.string "email", limit: 100, null: false
    t.string "phone_number", limit: 15
    t.index ["email"], name: "email", unique: true
  end

  create_table "restaurant", primary_key: "restaurant_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.string "phone_number", limit: 15, null: false
    t.string "restaurant_logo"
    t.string "restaurant_category", limit: 128
  end

  create_table "restaurant_tables", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tables", primary_key: "table_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "table_number", null: false
    t.integer "capacity", null: false
    t.string "description"
    t.integer "restaurant_id"
    t.boolean "available", default: true
    t.index ["restaurant_id"], name: "restaurant_id"
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "bookings", "tables", primary_key: "table_id", name: "fk_bookings_restaurant_table", on_delete: :cascade
  add_foreign_key "bookings", "users"
  add_foreign_key "tables", "restaurant", primary_key: "restaurant_id", name: "tables_ibfk_1", on_delete: :cascade
end

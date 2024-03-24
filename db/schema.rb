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

ActiveRecord::Schema[7.1].define(version: 2024_03_24_160544) do
  create_table "bookings", primary_key: "booking_id", id: :integer, charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "customer_id"
    t.integer "table_id"
    t.datetime "booking_date", precision: nil, null: false
    t.integer "duration_minutes", null: false
    t.index ["customer_id"], name: "fk_customer"
    t.index ["table_id"], name: "fk_table"
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
    t.binary "restaurant_logo"
    t.string "restaurant_category", limit: 128
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
    t.index ["restaurant_id"], name: "restaurant_id"
    t.index ["table_number"], name: "table_number", unique: true
  end

  add_foreign_key "bookings", "customers", primary_key: "customer_id", name: "fk_customer"
  add_foreign_key "bookings", "tables", primary_key: "table_id", name: "fk_table"
  add_foreign_key "tables", "restaurant", primary_key: "restaurant_id", name: "tables_ibfk_1", on_delete: :cascade
end

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


ActiveRecord::Schema.define(version: 2022_06_06_140143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "number_of_plug"
    t.string "location"
    t.string "color"
    t.integer "cable_length"
    t.string "brand"
    t.boolean "usb"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "title"
    t.index ["user_id"], name: "index_ads_on_user_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "ad_id", null: false
    t.integer "rate"
    t.text "comment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["ad_id"], name: "index_ratings_on_ad_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "rentals", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "ad_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ad_id"], name: "index_rentals_on_ad_id"
    t.index ["user_id"], name: "index_rentals_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "ads", "users"
  add_foreign_key "ratings", "ads"
  add_foreign_key "ratings", "users"
  add_foreign_key "rentals", "ads"
  add_foreign_key "rentals", "users"
end

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

ActiveRecord::Schema.define(version: 2020_08_31_103322) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "inquiries", force: :cascade do |t|
    t.string "status"
    t.string "message"
    t.bigint "offer_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["offer_id"], name: "index_inquiries_on_offer_id"
    t.index ["user_id"], name: "index_inquiries_on_user_id"
  end

  create_table "offers", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "skills_required"
    t.integer "compensation"
    t.boolean "fixed_price"
    t.string "location"
    t.date "deadline_at"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_offers_on_user_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.string "description"
    t.bigint "inquiry_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["inquiry_id"], name: "index_reviews_on_inquiry_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.string "user_type"
    t.string "bio"
    t.string "location"
    t.date "dob"
    t.string "phone_number"
    t.integer "hourly_rate"
    t.string "headline"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "inquiries", "offers"
  add_foreign_key "inquiries", "users"
  add_foreign_key "offers", "users"
  add_foreign_key "reviews", "inquiries"
end

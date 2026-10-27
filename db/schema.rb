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

ActiveRecord::Schema[8.0].define(version: 2026_09_18_145751) do
  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categoryquotes", force: :cascade do |t|
    t.integer "quote_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categoryquotes_on_category_id"
    t.index ["quote_id"], name: "index_categoryquotes_on_quote_id"
  end

  create_table "quotes", force: :cascade do |t|
    t.string "text", null: false
    t.date "pub_year"
    t.string "comment"
    t.integer "user_id", null: false
    t.integer "source_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["source_id"], name: "index_quotes_on_source_id"
    t.index ["user_id"], name: "index_quotes_on_user_id"
  end

  create_table "sources", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.date "dob"
    t.date "dod"
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "fname", null: false
    t.string "lname", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "status", default: "Active", null: false
    t.boolean "is_admin", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "categoryquotes", "categories"
  add_foreign_key "categoryquotes", "quotes"
  add_foreign_key "quotes", "sources"
  add_foreign_key "quotes", "users"
end

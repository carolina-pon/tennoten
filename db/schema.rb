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

ActiveRecord::Schema.define(version: 2021_08_07_155736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_works", force: :cascade do |t|
    t.bigint "work_id"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_id"], name: "index_author_works_on_author_id"
    t.index ["work_id"], name: "index_author_works_on_work_id"
  end

  create_table "authors", force: :cascade do |t|
    t.string "name", null: false
    t.string "site", null: false
    t.string "sns"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_authors_on_name", unique: true
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_categories_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  create_table "work_categories", force: :cascade do |t|
    t.bigint "work_id"
    t.bigint "category_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_work_categories_on_category_id"
    t.index ["work_id"], name: "index_work_categories_on_work_id"
  end

  create_table "works", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.string "size"
    t.string "weight"
    t.string "material", null: false
    t.string "images", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "author_works", "authors"
  add_foreign_key "author_works", "works"
  add_foreign_key "work_categories", "categories"
  add_foreign_key "work_categories", "works"
end

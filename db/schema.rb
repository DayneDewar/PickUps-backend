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

ActiveRecord::Schema.define(version: 2021_04_19_011724) do

  create_table "events", force: :cascade do |t|
    t.string "location"
    t.boolean "equipment"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "sport_id", null: false
    t.date "date"
    t.time "time"
    t.float "lat"
    t.float "lng"
    t.datetime "datetime"
    t.index ["sport_id"], name: "index_events_on_sport_id"
  end

  create_table "favorite_sports", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "sport_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["sport_id"], name: "index_favorite_sports_on_sport_id"
    t.index ["user_id"], name: "index_favorite_sports_on_user_id"
  end

  create_table "sports", force: :cascade do |t|
    t.string "name"
    t.string "equipment"
    t.string "image"
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "rules"
    t.index ["user_id"], name: "index_sports_on_user_id"
  end

  create_table "user_events", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "event_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["event_id"], name: "index_user_events_on_event_id"
    t.index ["user_id"], name: "index_user_events_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.integer "age"
    t.string "location"
    t.integer "rating"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "bio"
    t.string "firstname"
    t.string "lastname"
    t.string "username"
    t.string "password_digest"
  end

  add_foreign_key "events", "sports"
  add_foreign_key "favorite_sports", "sports"
  add_foreign_key "favorite_sports", "users"
  add_foreign_key "sports", "users"
  add_foreign_key "user_events", "events"
  add_foreign_key "user_events", "users"
end

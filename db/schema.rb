# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170118012149) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "note"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accommodations", ["city_id"], name: "index_accommodations_on_city_id", using: :btree

  create_table "activities", force: :cascade do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "activities", ["city_id"], name: "index_activities_on_city_id", using: :btree

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "country"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "cities", ["user_id"], name: "index_cities_on_user_id", using: :btree

  create_table "days", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "number"
    t.string   "location"
    t.string   "note"
    t.string   "accommodation"
    t.string   "activity"
    t.date     "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "days", ["trip_id"], name: "index_days_on_trip_id", using: :btree

  create_table "eateries", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "note"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "eateries", ["city_id"], name: "index_eateries_on_city_id", using: :btree

  create_table "sights", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "note"
    t.integer  "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sights", ["city_id"], name: "index_sights_on_city_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "name"
    t.date     "startdate"
    t.date     "enddate"
    t.string   "country"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "user_id"
  end

  add_index "trips", ["user_id"], name: "index_trips_on_user_id", using: :btree

  create_table "user_trips", force: :cascade do |t|
    t.integer  "trip_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_trips", ["trip_id"], name: "index_user_trips_on_trip_id", using: :btree
  add_index "user_trips", ["user_id"], name: "index_user_trips_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "hometown"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_foreign_key "accommodations", "cities"
  add_foreign_key "activities", "cities"
  add_foreign_key "cities", "users"
  add_foreign_key "days", "trips"
  add_foreign_key "eateries", "cities"
  add_foreign_key "sights", "cities"
  add_foreign_key "trips", "users"
  add_foreign_key "user_trips", "trips"
  add_foreign_key "user_trips", "users"
end

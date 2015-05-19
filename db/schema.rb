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

ActiveRecord::Schema.define(version: 20150519181518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.string   "genre"
    t.text     "description"
    t.string   "city"
    t.integer  "zip"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "facebook"
    t.string   "soundcloud"
    t.string   "last_fm"
  end

  add_index "bands", ["user_id"], name: "index_bands_on_user_id", using: :btree

  create_table "bands_fans", force: :cascade do |t|
    t.integer "band_id"
    t.integer "fan_id"
  end

  create_table "bands_gigs", force: :cascade do |t|
    t.integer "band_id"
    t.integer "gig_id"
  end

  create_table "bands_users", force: :cascade do |t|
    t.integer "band_id"
    t.integer "user_id"
  end

  create_table "fans", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "gigrequests", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "timeslot_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "gigs", force: :cascade do |t|
    t.string   "event"
    t.time     "doors"
    t.time     "showtime"
    t.string   "age"
    t.string   "price"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "timeslot_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "timeslots", force: :cascade do |t|
    t.date     "date"
    t.time     "start_time"
    t.time     "end_time"
    t.integer  "openings"
    t.integer  "pay_amount"
    t.boolean  "paid_gig"
    t.string   "notes"
    t.integer  "venue_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "role"
    t.boolean  "is_admin"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_venues", force: :cascade do |t|
    t.integer "user_id"
    t.integer "venue_id"
  end

  create_table "venues", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.text     "description"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.integer  "zip"
    t.string   "phone"
    t.string   "email"
    t.string   "twitter"
    t.string   "facebook"
    t.string   "instagram"
  end

  add_index "venues", ["user_id"], name: "index_venues_on_user_id", using: :btree

  add_foreign_key "bands", "users"
  add_foreign_key "venues", "users"
end

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

ActiveRecord::Schema.define(version: 20150714204158) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string   "title"
    t.text     "comment"
    t.string   "image_url"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.date     "release_year"
    t.integer  "band_id"
  end

  create_table "bandlists", force: :cascade do |t|
    t.integer  "band_id"
    t.integer  "gig_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "hired",      default: false, null: false
  end

  add_index "bandlists", ["band_id"], name: "index_bandlists_on_band_id", using: :btree
  add_index "bandlists", ["gig_id"], name: "index_bandlists_on_gig_id", using: :btree

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

  create_table "follows", force: :cascade do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "gigs", force: :cascade do |t|
    t.string   "event"
    t.string   "age"
    t.string   "price"
    t.text     "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "is_final"
    t.date     "date"
    t.time     "showtime"
    t.time     "doors"
    t.integer  "openings"
    t.decimal  "pay_amount",  precision: 5, scale: 2
    t.boolean  "paid_gig"
    t.string   "notes"
    t.integer  "venue_id"
  end

  add_index "gigs", ["venue_id"], name: "index_gigs_on_venue_id", using: :btree

  create_table "likes", force: :cascade do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables", using: :btree
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes", using: :btree

  create_table "mentions", force: :cascade do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables", using: :btree
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions", using: :btree

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

  create_table "setlists", force: :cascade do |t|
    t.integer "song_id"
    t.integer "bandlist_id"
  end

  add_index "setlists", ["bandlist_id"], name: "index_setlists_on_bandlist_id", using: :btree
  add_index "setlists", ["song_id"], name: "index_setlists_on_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string  "title"
    t.text    "comment"
    t.string  "genre"
    t.integer "album_id"
    t.integer "track"
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

  add_foreign_key "bandlists", "bands"
  add_foreign_key "bandlists", "gigs"
  add_foreign_key "bands", "users"
  add_foreign_key "gigs", "venues"
end

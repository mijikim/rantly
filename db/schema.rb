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

ActiveRecord::Schema.define(version: 20141017224130) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorited_rants", force: true do |t|
    t.integer  "rant_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "favorited_rants", ["rant_id"], name: "index_favorited_rants_on_rant_id", using: :btree
  add_index "favorited_rants", ["user_id"], name: "index_favorited_rants_on_user_id", using: :btree

  create_table "rants", force: true do |t|
    t.string   "category"
    t.text     "rant"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "favorited",  default: 0
    t.boolean  "spam",       default: false
  end

  create_table "user_relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_relationships", ["followed_user_id"], name: "index_user_relationships_on_followed_user_id", using: :btree
  add_index "user_relationships", ["follower_id"], name: "index_user_relationships_on_follower_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.text     "bio"
    t.string   "rant_frequency"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

end

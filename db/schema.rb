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

ActiveRecord::Schema.define(version: 20151014071640) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "author_name"
    t.string   "author_email"
    t.string   "content"
    t.integer  "target_id"
    t.string   "target_type"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "comments", ["id"], name: "index_comments_on_id", using: :btree
  add_index "comments", ["target_type", "target_id"], name: "index_comments_on_target_type_and_target_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.string   "address"
    t.datetime "started_at"
    t.string   "image",      default: "no_image.png"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "tag_ids",    default: [],                          array: true
  end

  add_index "events", ["id"], name: "index_events_on_id", using: :btree
  add_index "events", ["tag_ids"], name: "index_events_on_tag_ids", using: :gin

  create_table "posts", force: :cascade do |t|
    t.string   "title"
    t.string   "content"
    t.string   "image",      default: "no_image.png"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "tag_ids",    default: [],                          array: true
  end

  add_index "posts", ["id"], name: "index_posts_on_id", using: :btree
  add_index "posts", ["tag_ids"], name: "index_posts_on_tag_ids", using: :gin

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "video"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "tag_ids",     default: [],              array: true
  end

  add_index "videos", ["id"], name: "index_videos_on_id", using: :btree
  add_index "videos", ["tag_ids"], name: "index_videos_on_tag_ids", using: :gin

end

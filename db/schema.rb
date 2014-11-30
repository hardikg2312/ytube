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

ActiveRecord::Schema.define(version: 20141130094548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "category_name"
    t.string   "category_photo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "channels", force: true do |t|
    t.string   "ytube_id"
    t.integer  "channel_category_id"
    t.text     "title"
    t.text     "content"
    t.text     "thumbnail"
    t.integer  "subscription_count"
    t.integer  "total_views"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "videos", force: true do |t|
    t.string   "video_id"
    t.string   "video_url"
    t.string   "title"
    t.integer  "channel_id"
    t.string   "thumbnail_medium"
    t.string   "thumbnail_high"
    t.string   "thumbnail_standard"
    t.text     "description"
    t.datetime "published_at"
    t.integer  "view_count"
    t.integer  "like_count"
    t.integer  "dislike_count"
    t.integer  "comment_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

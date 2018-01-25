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

ActiveRecord::Schema.define(version: 20171201182138) do

  create_table "broadcasts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_broadcasts_on_user_id"
  end

  create_table "broadcasts_feeds", id: false, force: :cascade do |t|
    t.integer "broadcast_id"
    t.integer "feed_id"
    t.index ["broadcast_id"], name: "index_broadcasts_feeds_on_broadcast_id"
    t.index ["feed_id"], name: "index_broadcasts_feeds_on_feed_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "anonymous"
    t.integer "user_id"
    t.string "title"
    t.integer "replies_count"
  end

  create_table "feeds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer "user_id"
    t.string "photo_file_name"
    t.string "photo_content_type"
    t.integer "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["user_id"], name: "index_images_on_user_id"
  end

  create_table "post_notifications", force: :cascade do |t|
    t.integer "post_id"
    t.boolean "seen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_post_notifications_on_user_id"
  end

  create_table "read_post_ids", force: :cascade do |t|
    t.integer "read_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_read_post_ids_on_user_id"
  end

  create_table "replies", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "anonymous"
    t.text "text"
    t.integer "user_id"
    t.integer "post_id"
    t.string "title"
    t.integer "comment_id"
    t.integer "parent_id"
    t.integer "reply_id"
    t.integer "child_number"
    t.index ["comment_id"], name: "index_replies_on_comment_id"
    t.index ["reply_id"], name: "index_replies_on_reply_id"
  end

  create_table "user_details", force: :cascade do |t|
    t.string "login"
    t.string "salt"
    t.string "crypted_password"
    t.integer "user_id"
    t.index ["user_id"], name: "index_user_details_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "surname", null: false
    t.string "firstname", null: false
    t.string "phone"
    t.integer "grad_year", null: false
    t.boolean "jobs", default: false
    t.string "email", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "show_notifications"
    t.index ["email"], name: "index_users_on_email"
    t.index ["surname"], name: "index_users_on_surname"
  end

end

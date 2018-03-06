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

ActiveRecord::Schema.define(version: 20180306095949) do

  create_table "friendships", force: :cascade do |t|
    t.integer "requester_id"
    t.integer "requested_id"
    t.boolean "accepted"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["requested_id"], name: "index_friendships_on_requested_id"
    t.index ["requester_id", "requested_id"], name: "index_friendships_on_requester_id_and_requested_id", unique: true
    t.index ["requester_id"], name: "index_friendships_on_requester_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "user_id"
    t.string "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "crypted_password"
    t.string "password_salt"
    t.string "persistence_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_logit_at"
    t.string "current_login_ip"
    t.string "last_login_ip"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end

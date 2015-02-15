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

ActiveRecord::Schema.define(version: 20150215103222) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: true do |t|
    t.string   "status",     default: "active"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listing_id"
    t.integer  "offer_id"
  end

  add_index "bookings", ["listing_id"], name: "index_bookings_on_listing_id", unique: true, using: :btree
  add_index "bookings", ["offer_id"], name: "index_bookings_on_offer_id", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: true do |t|
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "title"
    t.text     "body"
    t.string   "subject"
    t.integer  "user_id",          null: false
    t.integer  "parent_id"
    t.integer  "lft"
    t.integer  "rgt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id", "commentable_type"], name: "index_comments_on_commentable_id_and_commentable_type", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "contractors", force: true do |t|
    t.integer  "wage"
    t.boolean  "certified"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "verified",    default: false
    t.integer  "user_id"
    t.string   "status",      default: "active"
  end

  add_index "contractors", ["user_id"], name: "index_contractors_on_user_id", unique: true, using: :btree

  create_table "listings", force: true do |t|
    t.string   "title"
    t.integer  "budget"
    t.text     "description"
    t.string   "image"
    t.string   "status",      default: "uncontracted"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "offers", force: true do |t|
    t.integer  "price"
    t.string   "status"
    t.integer  "listing_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "hours"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "avatar"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "role"
    t.string   "phone_number"
    t.string   "user_avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: true do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

end

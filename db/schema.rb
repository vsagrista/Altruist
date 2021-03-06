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

ActiveRecord::Schema.define(version: 20151005173945) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "meetings", force: :cascade do |t|
    t.string   "name"
    t.datetime "start_time"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "transaction_id"
  end

  add_index "meetings", ["transaction_id"], name: "index_meetings_on_transaction_id", using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "rating",      default: 10
    t.text     "comments"
    t.text     "address"
  end

  add_index "skills", ["user_id"], name: "index_skills_on_user_id", using: :btree

  create_table "transactions", force: :cascade do |t|
    t.integer  "creator_id"
    t.integer  "user_id"
    t.integer  "skill_id"
    t.integer  "rating",         default: 0
    t.integer  "minutes",        default: 60
    t.boolean  "completed",      default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "rated",          default: false
    t.datetime "date"
    t.string   "subject"
    t.text     "comment_review"
  end

  add_index "transactions", ["user_id"], name: "index_transactions_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "name"
    t.text     "about"
    t.text     "address"
    t.integer  "phone"
    t.integer  "minutes",                default: 60
    t.integer  "rating",                 default: 0
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "meetings", "transactions"
end

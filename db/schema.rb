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

ActiveRecord::Schema.define(version: 20141025115515) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "businesses", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "destination_url"
    t.string   "reward_1"
    t.string   "reward_2"
    t.string   "reward_3"
    t.integer  "threshold_1"
    t.integer  "threshold_2"
    t.integer  "threshold_3"
  end

  add_index "businesses", ["email"], name: "index_businesses_on_email", unique: true, using: :btree
  add_index "businesses", ["reset_password_token"], name: "index_businesses_on_reset_password_token", unique: true, using: :btree

  create_table "referrers", force: true do |t|
    t.integer  "business_id",                  null: false
    t.string   "email",                        null: false
    t.integer  "click_count",      default: 0
    t.integer  "conversion_count", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "referrers", ["business_id", "email"], name: "index_referrers_on_business_id_and_email", unique: true, using: :btree

end

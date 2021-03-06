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

ActiveRecord::Schema.define(version: 20160707042635) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  limit: nil, default: "", null: false
    t.string   "encrypted_password",     limit: nil, default: "", null: false
    t.string   "reset_password_token",   limit: nil
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "cards", force: true do |t|
    t.string   "card_retailer"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "expenses", force: true do |t|
    t.date     "date"
    t.string   "retailer"
    t.decimal  "amt_charged",          precision: 10, scale: 2
    t.decimal  "amt_paid",             precision: 10, scale: 2
    t.boolean  "split"
    t.string   "how_to_pay"
    t.integer  "payment_status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "card_id"
    t.integer  "responsible_party_id"
    t.decimal  "amt_pending",          precision: 10, scale: 2
    t.boolean  "archived",                                      default: false
  end

  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id", using: :btree

  create_table "payments", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "expense_id"
    t.integer  "payplan_id"
    t.decimal  "amt_paid",             precision: 10, scale: 2
    t.date     "date"
    t.integer  "card_id"
    t.integer  "user_id"
    t.integer  "responsible_party_id"
    t.boolean  "archived",                                      default: false
    t.string   "how_to_pay"
  end

  create_table "payplans", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
    t.integer  "card_id"
    t.text     "comments"
    t.integer  "user_id"
    t.boolean  "archived",   default: false
  end

  create_table "responsible_parties", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "users", force: true do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

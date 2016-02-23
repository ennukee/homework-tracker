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

ActiveRecord::Schema.define(version: 20160223032618) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assignments", force: :cascade do |t|
    t.string   "name"
    t.date     "due_date"
    t.integer  "percent_done"
    t.string   "assn_type"
    t.integer  "priority"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "user_id"
    t.boolean  "important",    default: false
  end

  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "site_texts", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.boolean  "important"
    t.boolean  "markdown"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "password"
    t.datetime "created_at",                                                                                   null: false
    t.datetime "updated_at",                                                                                   null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.string   "email"
    t.string   "assignment_types", default: ["Extra Credit", "Homework", "Major Homework", "Project", "Exam"],              array: true
    t.integer  "privilege",        default: 0
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "assignments", "users"
end

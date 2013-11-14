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

ActiveRecord::Schema.define(version: 20131114223709) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: true do |t|
    t.string   "line1"
    t.string   "line2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.integer  "uder_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", force: true do |t|
    t.boolean  "available",   default: true
    t.string   "name"
    t.text     "description"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", force: true do |t|
    t.string   "display_name"
    t.boolean  "admin",        default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
    t.string   "provider"
    t.string   "image"
    t.string   "name"
    t.integer  "weight",       default: 130
    t.string   "sex",          default: "male"
  end

  create_table "items", force: true do |t|
    t.boolean  "available",   default: true
    t.string   "name"
    t.text     "description"
    t.integer  "price"
    t.integer  "cost"
    t.integer  "category_id"
    t.integer  "sort_order"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "abv"
    t.decimal  "volume"
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree

  create_table "order_items", force: true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.integer  "quantity"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "my_drink"
  end

  create_table "orders", force: true do |t|
    t.integer  "customer_id"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

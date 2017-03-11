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

ActiveRecord::Schema.define(version: 20170311185354) do

  create_table "clerks", force: :cascade do |t|
    t.integer  "clekr_id"
    t.string   "clerk_name"
    t.integer  "clerk_age"
    t.text     "clerk_address"
    t.integer  "clerk_contact"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "phone_num"
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "order_quantity"
    t.decimal  "order_total"
    t.decimal  "item_price"
    t.date     "order_date"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "products", force: :cascade do |t|
    t.integer  "product_id"
    t.string   "product_name"
    t.decimal  "product_price"
    t.integer  "product_stock"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "stocks", force: :cascade do |t|
    t.integer  "stock_quantity"
    t.decimal  "stock_price"
    t.decimal  "stock_payment"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "stock_counter"
    t.string   "stock_name"
  end

  create_table "suppliers", force: :cascade do |t|
    t.integer  "supplier_id"
    t.string   "supplier_name"
    t.text     "supplier_address"
    t.date     "shipment_date"
    t.decimal  "shipment_amount"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end

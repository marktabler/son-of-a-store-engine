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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130502042829) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "categories", ["id"], :name => "index_categories_on_id"

  create_table "categories_products", :force => true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  add_index "categories_products", ["category_id", "product_id"], :name => "index_categories_products_on_category_id_and_product_id"
  add_index "categories_products", ["category_id"], :name => "index_categories_products_on_category_id"
  add_index "categories_products", ["id"], :name => "index_categories_products_on_id"
  add_index "categories_products", ["product_id", "category_id"], :name => "index_categories_products_on_product_id_and_category_id"
  add_index "categories_products", ["product_id"], :name => "index_categories_products_on_product_id"

  create_table "order_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.integer  "quantity"
    t.decimal  "unit_price",    :precision => 8, :scale => 2
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
    t.decimal  "selling_price", :precision => 8, :scale => 2
    t.decimal  "percent_off",   :precision => 8, :scale => 2
  end

  add_index "order_items", ["id"], :name => "index_order_items_on_id"
  add_index "order_items", ["order_id", "product_id"], :name => "index_order_items_on_order_id_and_product_id"
  add_index "order_items", ["order_id"], :name => "index_order_items_on_order_id"
  add_index "order_items", ["product_id", "order_id"], :name => "index_order_items_on_product_id_and_order_id"
  add_index "order_items", ["product_id"], :name => "index_order_items_on_product_id"

  create_table "orders", :force => true do |t|
    t.integer  "user_id"
    t.string   "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "orders", ["id"], :name => "index_orders_on_id"
  add_index "orders", ["status"], :name => "index_orders_on_status"
  add_index "orders", ["user_id"], :name => "index_orders_on_user_id"

  create_table "products", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",       :precision => 8, :scale => 2
    t.string   "status"
    t.string   "image_path"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "products", ["id"], :name => "index_products_on_id"
  add_index "products", ["status"], :name => "index_products_on_status"
  add_index "products", ["title"], :name => "index_products_on_title"

  create_table "ratings", :force => true do |t|
    t.integer  "product_id"
    t.integer  "user_id"
    t.string   "title"
    t.text     "body"
    t.integer  "stars",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "ratings", ["id"], :name => "index_ratings_on_id"
  add_index "ratings", ["product_id", "user_id"], :name => "index_ratings_on_product_id_and_user_id"
  add_index "ratings", ["product_id"], :name => "index_ratings_on_product_id"
  add_index "ratings", ["user_id", "product_id"], :name => "index_ratings_on_user_id_and_product_id"
  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"

  create_table "sales", :force => true do |t|
    t.integer  "foreign_key"
    t.integer  "percent_off", :default => 1
    t.string   "group"
    t.string   "status"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "sales", ["id"], :name => "index_sales_on_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "full_name"
    t.string   "display_name"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.boolean  "admin"
  end

  add_index "users", ["id"], :name => "index_users_on_id"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"

end

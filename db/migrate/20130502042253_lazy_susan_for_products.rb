class LazySusanForProducts < ActiveRecord::Migration
  def change
    add_index :products, :id
    add_index :orders, :id
    add_index :order_items, :id
    add_index :order_items, [:order_id, :product_id]
    add_index :order_items, [:product_id, :order_id]
    add_index :categories, :id
    add_index :users, :id
    add_index :categories_products, :id
    add_index :categories_products, :category_id
    add_index :categories_products, :product_id
    add_index :categories_products, [:category_id, :product_id]
    add_index :categories_products, [:product_id, :category_id]
    add_index :ratings, :id
    add_index :ratings, :product_id
    add_index :ratings, :user_id
    add_index :ratings, [:product_id, :user_id]
    add_index :ratings, [:user_id, :product_id]
    add_index :sales, :id
  end
end

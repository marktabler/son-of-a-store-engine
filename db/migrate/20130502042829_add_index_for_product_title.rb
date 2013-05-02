class AddIndexForProductTitle < ActiveRecord::Migration
  def change
    add_index :products, :title
    add_index :products, :status
    add_index :orders, :status
  end
end

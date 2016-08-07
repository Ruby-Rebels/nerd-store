class RemoveQuantityProductId < ActiveRecord::Migration
  def change
    remove_column :orders, :quantity
    remove_column :orders, :product_id
  end
end

class UpdateOrder < ActiveRecord::Migration[6.0]
  def change
  	remove_column :orders, :produce_id
  	remove_column :orders, :quantity
  	add_column :orders, :order_status, :integer, default: 0
  end
end

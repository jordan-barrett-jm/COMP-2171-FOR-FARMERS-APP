class UpdateOrders < ActiveRecord::Migration[6.0]
  def change
  	rename_column :orders, :order_status, :status
  end
end

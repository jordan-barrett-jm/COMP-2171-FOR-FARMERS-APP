class AddFarmerIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :farmer_id, :integer
  end
end

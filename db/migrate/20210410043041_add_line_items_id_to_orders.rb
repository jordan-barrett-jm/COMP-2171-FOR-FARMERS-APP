class AddLineItemsIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :line_items_id, :integer
  end
end

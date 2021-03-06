class AddOrdersToLineItems < ActiveRecord::Migration[6.0]
  def change
    add_reference :line_items, :order, foreign_key: true, index: true
  end
end

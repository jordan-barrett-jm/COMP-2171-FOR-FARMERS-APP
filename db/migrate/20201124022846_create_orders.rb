class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.integer :produce_id
      t.integer :consumer_id
      t.integer :quantity

      t.timestamps
    end
  end
end

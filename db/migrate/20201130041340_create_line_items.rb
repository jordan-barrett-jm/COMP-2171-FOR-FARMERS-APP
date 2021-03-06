class CreateLineItems < ActiveRecord::Migration[6.0]
  def change
  	drop_table :line_items
    create_table :line_items do |t|
      t.string :produce_id
      t.integer :quantity
      t.references :shopping_cart, null: false, foreign_key: true

      t.timestamps
    end
  end
end

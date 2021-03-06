class CreateShoppingCarts < ActiveRecord::Migration[6.0]
  def change
  	drop_table :shopping_carts
    create_table :shopping_carts do |t|
      t.references :consumer, null: false, foreign_key: true

      t.timestamps
    end
  end
end

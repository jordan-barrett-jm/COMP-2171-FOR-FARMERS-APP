class AddReferencesToShoppingCart < ActiveRecord::Migration[6.0]
  def change
    add_reference :shopping_carts, :consumer, null: false, foreign_key: true
  end
end

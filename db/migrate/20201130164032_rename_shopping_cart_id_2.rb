class RenameShoppingCartId2 < ActiveRecord::Migration[6.0]
  def change
  	rename_column :line_items, :shoppingcart_id, :shopping_cart_id
  end
end

class RenameShoppingCartId < ActiveRecord::Migration[6.0]
  def change

  	rename_column :line_items, :shopping_cart_id, :shoppingcart_id
  end
end

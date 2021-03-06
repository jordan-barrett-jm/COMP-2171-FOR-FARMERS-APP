json.extract! line_item, :id, :produce_id, :quantity, :shoppingcart_id, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)

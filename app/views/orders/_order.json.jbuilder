json.extract! order, :id, :produce_id, :consumer_id, :quantity, :created_at, :updated_at
json.url order_url(order, format: :json)

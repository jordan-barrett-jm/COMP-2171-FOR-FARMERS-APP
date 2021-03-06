class ShoppingCart < ApplicationRecord
	has_many :line_items, dependent: :destroy
  belongs_to :consumer

  def self.user_cart(user)
  	self.find_by_consumer_id(Consumer.find_by_user_id(user.id))
  end

  def amound_in_cart
  	line_items.where(order_id: nil).count
  end
end

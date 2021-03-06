class Consumer < ApplicationRecord
  belongs_to :user
	has_many :reviews
  has_one :shoppingcart

  def self.find_by_current_user(current_user_id)
  	self.find_by_user_id(current_user_id)
  end
end

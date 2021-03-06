class Order < ApplicationRecord
	has_many :line_items
	enum status: [:pending, :accepted, :fulfilled, :cancelled]

	def change_status(status)
		update_attributes(status: status)
	end

	def assign_badge_class
		if pending?
			"badge-warning text-white"
		elsif accepted?
			"badge-primary"
		elsif fulfilled?
			"badge-success"
		else
			"badge-danger"
		end	
	end
end

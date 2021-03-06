module UsersHelper

	def farmer?
		current_user and current_user.farmer?	
	end

	def consumer?
		current_user and current_user.consumer?
	end

	def current_farmer
		Farmer.find_by_user_id(current_user.id) 
	end

	def current_consumer
		Consumer.find_by_user_id(current_user.id)
	end
end

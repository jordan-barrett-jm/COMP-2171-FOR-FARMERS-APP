class AfterSignupController < Wicked::WizardController

	steps :add_account_details

	def show
		# Farmer.create(user_id: current_user.id) if current_user.farmer? and not Farmer.find_by_user_id(current_user.id)
		if current_user.consumer? and not Consumer.find_by_user_id(current_user.id)
			@consumer = Consumer.new(user_id: current_user.id) 
			
			if @consumer.save
				# Create Shopping cart for user
				ShoppingCart.create(consumer_id: @consumer.id)
			end
		end

		@user = current_user
		@user.farmers.build
		render_wizard
	end

	def update
		@user = current_user
		@user.update(account_details_params)
		render_wizard @user
	end

	private

	def account_details_params
		params.require(:user).permit(:first_name,
																 :middle_name,
																 :last_name,
																 :address_line_1,
																 :address_line_2,
																 :city,
																 :parish,
																 :phone_number,
																 :avatar,
																 :farmers_attributes => [:farm_name])
	end

end

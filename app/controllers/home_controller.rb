class HomeController < ApplicationController
  def index
  	if !current_user
  		redirect_to new_user_session
  	end

  	@produces = Produce.where(available: true)
  	@produces = Produce.where("name ILIKE ?", "%#{params[:search][:name]}%") if params[:search].present?
  end

  def landing
  end
end

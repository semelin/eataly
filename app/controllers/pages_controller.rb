class PagesController < ApplicationController
	before_action :authenticate_user!, only: [:dasboard]
  def home
  	if current_user
  		redirect_to foods_path
  	end
  	@foods = Food.last(4)
  end

  def dashboard
  	@foods = current_user.foods
  end
end

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
    @purchased = Sale.where(buyer_email: current_user.email)
    @sales = Sale.where(seller_email: current_user.email)
  end
end

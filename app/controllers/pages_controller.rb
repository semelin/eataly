class PagesController < ApplicationController
  def home
  	if current_user
  		redirect_to foods_path
  	end
  end
end

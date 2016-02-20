class TransactionsController< ApplicationController

def create
		food = Food.find_by!(slug: params[:slug])
		sale = food.sales.create(
			amount: food.price, 
			buyer_email: current_user.email, 
			seller_email: food.user.email, 
			stripe_token: params[:stripeToken])
		sale.process!

	if sale.finished?
			redirect_to pickup_url(guid: @sale.guid)
		else 
			redirect_to food_path(food), notice: @error
		end
		end

	def pickup
		@sale = Sale.find_by!(guid: params[:guid])
		@food = @sale.food
	end

end

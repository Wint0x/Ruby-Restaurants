class RestaurantController < ApplicationController
	def index
		begin
			@restaurant_match = Restaurant.find("#{params[:id]}")
		rescue
			@restaurant_match = nil
		end
	end
end

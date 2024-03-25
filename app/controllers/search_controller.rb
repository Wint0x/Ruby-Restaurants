class SearchController < ApplicationController
	def index
		# May want to create an "advanced search page" too in the future...
		if (not !!params[:category])
			@restaurant_match = Restaurant.where("name LIKE ?", "%#{params[:query]}%")
		else
			@restaurant_match = Restaurant.where("restaurant_category LIKE ?", "%#{params[:query]}%")
		end
	end
end

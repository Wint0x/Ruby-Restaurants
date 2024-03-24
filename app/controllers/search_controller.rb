class SearchController < ApplicationController
	def index
		# May want to create an "advanced search page" too in the future...
		@restaurant_match = Restaurant.where("name LIKE ?", "%#{params[:query]}%")
	end
end

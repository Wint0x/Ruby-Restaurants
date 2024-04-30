class TablesController < ApplicationController
	def show
		@restaurant = Restaurant.find(params[:restaurant_id])
		puts @restaurant
		@restaurant_table = @restaurant.restaurant_tables.find_by(table_number: params[:table_number])
		puts @restaurant_table or "Nil Table"
  	end
end

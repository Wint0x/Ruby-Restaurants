class RestaurantController < ApplicationController
	def index
		begin
			@restaurant_match = Restaurant.find("#{params[:id]}")
			@restaurant_tables = RestaurantTable.where("restaurant_id = ?", params[:id]).select("table_number, capacity, description, available")
			
			@table_counter = 0
			@restaurant_tables.each { | table | @table_counter += 1 unless not table.available }

		rescue
			@restaurant_match = nil
		end
	end
end

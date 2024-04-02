class RestaurantTable < ApplicationRecord
	self.table_name = "tables"
	self.primary_key = "table_id"

	# belongs_to :restaurant
end

class Restaurant < ApplicationRecord
	self.table_name = "restaurant"
	self.primary_key = "restaurant_id"

	# has_many :tables
end

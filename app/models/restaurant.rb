class Restaurant < ApplicationRecord
	self.table_name = "restaurant"
	self.primary_key = "restaurant_id"
  	has_many :restaurant_tables, foreign_key: "restaurant_id", dependent: :destroy

  # Other validations and methods can go here
end

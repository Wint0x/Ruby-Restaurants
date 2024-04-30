class RestaurantTable < ApplicationRecord
  self.table_name = "tables"
  self.primary_key = "table_id"

  belongs_to :restaurant, foreign_key: "restaurant_id", dependent: :delete
  has_many :bookings, dependent: :destroy
  # Other validations and methods can go here
end

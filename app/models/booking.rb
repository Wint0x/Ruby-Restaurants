class Booking < ApplicationRecord
  after_destroy :set_table_available

  belongs_to :user
  belongs_to :restaurant_table, foreign_key: "table_id"

   private

  def set_table_available
    self.restaurant_table.update(available: true) if self.restaurant_table.present?
  end
end

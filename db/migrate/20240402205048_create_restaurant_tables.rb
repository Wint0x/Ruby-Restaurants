class CreateRestaurantTables < ActiveRecord::Migration[7.1]
  def change
    create_table :restaurant_tables do |t|

      t.timestamps
    end
  end
end

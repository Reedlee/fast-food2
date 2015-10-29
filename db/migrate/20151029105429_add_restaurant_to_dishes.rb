class AddRestaurantToDishes < ActiveRecord::Migration
  def change
    add_reference :dishes, :restaurant, foreign_key: true
  end
end

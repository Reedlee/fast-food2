class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :image_name
      t.text :review

      t.timestamps null: false
    end
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def logo_save(url_logo, title)
  require 'open-uri'
  new_file_path = Rails.root.join('public','restaurants', "#{title}.png")
  open(new_file_path, 'wb') do |file|
    file.write open(url_logo).read
  end
end

def create_restaurant
  name = Faker::Company.name
  new_name = name.tr(' ', '_')
  logo_save(Faker::Company.logo, new_name)
  review = Faker::Company.catch_phrase
  Restaurant.create(name: name, image_name: new_name, review: review)
end

def create_dish(max_dish_id)
  name = Faker::Commerce.product_name
  price = Faker::Commerce.price
  description = Faker::Lorem.sentence(3, true, 4)
  Dish.create(name: name, price: price, description: description, restaurant_id: rand(1..max_dish_id))
end



10.times do
  create_restaurant
end

40.times do
  create_dish(10)
end

admin = User.create(name: 'admin',
                    address: 'Aurora Borealis',
                    phone: '(100) 100-1000',
                    email: 'admin@example.com',
                    password: 'adminadmin',
                    password_confirmation: 'adminadmin',
                    admin: true)

2.times do
  name = Faker::Name.name
  User.create(name: name,
              address: "#{Faker::Address.city}, #{Faker::Address.street_address}",
              phone: Faker::PhoneNumber.cell_phone,
              email: Faker::Internet.email(name),
              password: 'password',
              password_confirmation: 'password')
end
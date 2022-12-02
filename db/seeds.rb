# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"

puts "Destroying all seeds..."
User.destroy_all
Foodplace.destroy_all
# Friendship.destroy_all

categories = ["restaurant", "bar", "cafe"]
puts 'Creating foodplaces...'
# User.create(email: "test@gmail.com", password: "123456")
10.times do
  Foodplace.create(name: Faker::Restaurant.name, address: Faker::Address.full_address, cuisine: Faker::Food.ethnic_category,\
  phone_number:Faker::PhoneNumber.phone_number_with_country_code, category: categories.sample, website: Faker::Internet.url  , google_rating: rand(1..5), opening_times:"8:00 - 18:00")
end

puts 'Creating users...'
users = [
  {
    first_name: "Salome",
    last_name: "Abramishvili",
    nickname: "Salome",
    email: "salome@abramishvili.com",
    password: "123456"
  },
  {
    first_name: "My Tran",
    last_name: "Bui",
    nickname: "My",
    email: "mytran@bui.com",
    password: "123456"
  },
  {
    first_name: "Alexandr",
    last_name: "Iampolskaia",
    nickname: "Alex",
    email: "alexandr@iampolskaia.com",
    password: "123456"
  },
  {
    first_name: "Bishwajit",
    last_name: "Karmaker",
    nickname: "abdullah",
    email: "bishwajit@karmaker.com",
    password: "123456"
  }
]

users.each do |user|
  # file = URI.open(user[:photo_url])
  user = User.create(
    first_name: user[:first_name],
    last_name: user[:last_name],
    nickname: user[:nickname],
    email: user[:email],
    password: "123456",
  )
  # user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: 'image/png')
  user.save
end

puts 'Finished with the users!'

puts 'Creating one friendship and one chatroom'
alex = User.find_by(first_name: "Alexandr")
salome = User.find_by(first_name: "Salome")
my = User.find_by(first_name: "My Tran")
abdullah = User.find_by(first_name: "Bishwajit")
# friendship_one = Friendship.create(user_one: alex, user_two: salome, status: "accepted")
# friendship_two = Friendship.create(user_one: alex, user_two: my, status: "accepted")
# Chatroom.create(friendship: friendship_one)
# Chatroom.create(friendship: friendship_two)

puts "Seed finished"
# require "faker"
# require "open-uri"

# puts "Cleaning database..."
# Grandparent.destroy_all
# User.destroy_all

# url = "https://tmdb.lewagon.com/movie/top_rated"
# movies_serialized = URI.open(url).read
# movies = JSON.parse(movies_serialized)

# test_user = User.create!(email: "test@gmail.com", password: "123456")

# grandparents_descriptions = ["Great hand of cooking, funny and friendly.", \
#   "Good in baking tasty cakes, has a huge stock of goodnight stories.", \
#   "Can make tasty and spicy foods, likes to go for jogging in afternoon.", \
#   "Good in making different fries, good in communication and open-mided.", \
#   "Always like to go for a trip with car, love to explore nature.", \
#   "Like to read books and tell stories, foodlover and love to taste new foods.",\
#   "Will take you for ride with his car for sure! Make you taste good food and visit new places where you were not before!", \
#   "Good in making different kind of new drinks. Like to spend time and have a good conversation with new people.", \
#   "Party guy! Loves to go for parties, dance and making new friends. Never feel bore!", \
#   "Love nature mostly, sea is the favorite spot to visit. Love pets and spending time together."]
# puts "Creating grandparents..."
# 30.times do
#   query = ["grandma", "grandpa", "senior"].sample
#   file = URI.open("https://source.unsplash.com/random/?#{query}")
#   grandparent = Grandparent.new(name: Faker::Name.name, description: grandparents_descriptions.sample, age: rand(60..85), address: Faker::Address.street_address, user: test_user)
#   grandparent.photo.attach(io: file, filename: "#{grandparent.name}.png", content_type: "image/png")
#   grandparent.save
# end

# puts "Seeding Finished!"

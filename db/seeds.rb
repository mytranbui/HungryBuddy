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
Favorite.destroy_all
Review.destroy_all
User.destroy_all
Foodplace.destroy_all

categories = ["restaurant", "bar", "cafe"]

puts 'Creating foodplaces...'

addresses = ["Huttenstraße 7, 10553 Berlin", "Zinnowitzer Str. 5, 10115 Berlin", "Potsdamer Str. 69, 10785 Berlin", \
              "Lützowstraße 19, 10785 Berlin", "Potsdamer Str. 84, 10785 Berlin", "Potsdamer Str. 75, 10785 Berlin", \
              "Potsdamer Str. 85, 10785 Berlin","Potsdamer Str. 99, 10785 Berlin", "Potsdamer Str. 73, 10785 Berlin", \
              "Eichhornstraße 3, 10785 Berlin","Kochstraße 16, 10969 Berlin","Friedrichstraße 211, 10969 Berlin",\
              "Rudi-Dutschke-Straße 25, 10969 Berlin","Charlottenstraße 76, 10117 Berlin","Rudi-Dutschke-Straße 26, 10969 Berlin", \
              "Zimmerstraße 19, 10969 Berlin","Hedemannstraße 10, 10969 Berlin","Friedrichstraße 200, 10117 Berlin", \
              "Chupenga Burritos & Salads","Köthener Str. 28, 10963 Berlin"," Rudi-Dutschke-Straße 23, 10969 Berlin", \
              " Rudi-Dutschke-Straße 20, 10969 Berlin","Charlottenstraße 79-80, 10117 Berlin","Friedrichstraße 12, 10969 Berlin", \
              "Wilhelmstraße 41A, 10963 Berlin","Rudi-Dutschke-Straße 9, 10969 Berlin","Charlottenstraße 63, 10117 Berlin", \
              "Charlottenstraße 1, 10969 Berlin"," Leipziger Str. 30, 10117 Berlin","Friedrichstraße 237, 10969 Berlin", \
              "Kottbusser Str. 1, 10999 Berlin","Kurfürstendamm 160, 10709 Berlin"," Köpenicker Str. 159, 10997 Berlin",
              "Adalbertstraße 97, 10999 Berlin","Am Ostbahnhof 9, 10243 Berlin","Wrangelstraße 20, 10997 Berlin",\
              "Admiralstraße 36-37, 10999 Berlin","Erich-Steinfurth-Straße 4, 10243 Berlin","Stralauer Pl. 30-31, 10243 Berlin",\
              "Kohlfurter Str. 37, 10999 Berlin","Fatih Servet Döner Restaurant im Ostbahnhof Am, Am Ostbahnhof 3, 10243 Berlin"," Lausitzer Pl. 12, 10997 Berlin"\
              "Alexanderpl. 7, 10178 Berlin","Mildred-Harnack-Straße 11, 10243 Berlin","Mariannenpl. 23, 10997 Berlin",\
              "Alexanderpl. 2, 10178 Berlin"," Strausberger Pl. 2, 10243 Berlin","Erich-Steinfurth-Straße 9, 10243 Berlin",\
              "Alexanderplatz, Panoramastraße 1A, 10178 Berlin","Mühlenstraße 5 / auf dem Mercedes-Platz, 10243 Berlin"]
i = 0
50.times do
  foodplace = Foodplace.new(name: Faker::Restaurant.name, address: addresses[i], cuisine: Faker::Food.ethnic_category, \
  phone_number: Faker::PhoneNumber.phone_number_with_country_code , category: categories.sample, website: Faker::Internet.url,\
  google_rating: rand(1..5), opening_times:"9:00 - 22:00")
  query = ["restaurant", "bar", "cafe"].sample
  file = URI.open("https://source.unsplash.com/random/?#{query}")
  foodplace.photo.attach(io: file, filename: "#{foodplace.name}.png", content_type: "image/png")
  foodplace.save
  i += 1
end


puts 'Creating users...'
users = [
  {
    first_name: "Salome",
    last_name: "Abramishvili",
    nickname: "Sally",
    email: "salome@abramishvili.com",
    password: "123456",
    photo_url: "https://avatars.githubusercontent.com/u/104451026?v=4",
    diet: "normal",
    likes: "deep fried foods",
    dislikes: "Onion",
    allergies: "None",
    bio: "I like to explore new dishes "
  },
  {
    first_name: "My Tran",
    last_name: "Bui",
    nickname: "My",
    email: "mytran@bui.com",
    password: "123456",
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1665338828/rclllxol7uwyh22glkdj.jpg",
    diet: "normal",
    likes: "Pastries, ice cream, mushrooms",
    dislikes: "Cucumber",
    allergies: "None",
    bio: "I am not vegetarian but like to try out vegetarian dishes :) "
  },
  {
    first_name: "Alexandr",
    last_name: "Iampolskaia",
    nickname: "Alex",
    email: "alexandr@iampolskaia.com",
    password: "123456",
    photo_url: "https://res.cloudinary.com/wagon/image/upload/c_fill,g_face,h_200,w_200/v1664738022/hde9mngzclpbctqcws8x.jpg",
    diet: "normal",
    likes: "Chinese food",
    dislikes: "Ginger",
    allergies: "None",
    bio: "I like to go to the restaurant with friends."
  },
  {
    first_name: "Bishwajit",
    last_name: "Karmaker",
    nickname: "Abdullah",
    email: "bishwajit@karmaker.com",
    password: "123456",
    photo_url: "https://avatars.githubusercontent.com/u/113314565?v=4",
    diet: "normal",
    likes: "Spicy food",
    dislikes: "tomato",
    allergies: "None",
    bio: "I like Asian dishes."
  }
]

users.each do |user_hash|
  user = User.create(
    first_name: user_hash[:first_name],
    last_name: user_hash[:last_name],
    nickname: user_hash[:nickname],
    email: user_hash[:email],
    password: "123456",
    diet: user_hash[:diet],
    likes: user_hash[:likes],
    dislikes: user_hash[:dislikes],
    allergies: user_hash[:allergies],
    bio: user_hash[:bio]
  )
  file = URI.open(user_hash[:photo_url])
  user.photo.attach(io: file, filename: "#{user.first_name}.png", content_type: 'image/png')
  user.save
end

# puts 'Finished with the users!'

# puts 'Creating one friendship and one chatroom'
alex = User.find_by(first_name: "Alexandr")
salome = User.find_by(first_name: "Salome")
my = User.find_by(first_name: "My Tran")
bishwajit = User.find_by(first_name: "Bishwajit")
# friendship_one = Friendship.create(user_one: alex, user_two: salome, status: "accepted")
# friendship_two = Friendship.create(user_one: alex, user_two: my, status: "accepted")
# Chatroom.create(friendship: friendship_one)
# Chatroom.create(friendship: friendship_two)

puts "Seed finished"

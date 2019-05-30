# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'json'

Review.destroy_all
Booking.destroy_all
Scooter.destroy_all
User.destroy_all

15.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Number.number(6)
  )
  user.save!
end

# 15.times do
#   scooter = Scooter.new(
#     description: Faker::Lorem.sentence(10),
#     status: ['Available', 'Unavailable'].sample,
#     location: Faker::Address.street_address,
#     user_id: rand(1..15),
#     name: Faker::FunnyName.name,
#     price: rand(30..50).to_s
#   )
#   scooter.remote_photo_url = 'https://picsum.photos/200/300'
#   scooter.save!
# end

# 15.times do
#   booking = Booking.new(
#     user_id: rand(1..15),
#     scooter_id: rand(1..15),
#     start_date: Faker::Date.between(rand(3..9).days.ago, Date.today),
#     end_date: Date.today
#   )
#   booking.save!

#   review = Review.new(
#     booking: booking,
#     rating: rand(1..5),
#     content: Faker::Lorem.sentence(10)
#   )
#   review.save!
# end








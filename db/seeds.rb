# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Starting seeds.."
Offer.destroy_all
User.destroy_all

puts "Creating users"
User.create(
  email: "batman@bat.man",
  password:"batmanbat",
  full_name: "Batman",
  user_type: "Developer",
  bio: "I am vengeance",
  location: "Gotham City",
  phone_number: "3343421236",
  hourly_rate: "1000 drops of blood",
  headline: "headline",
  business_address: "Business Adress 1234",
  business_name: "Business Name",
  business_vat_id: 5,
  business_size: "50",
  website: "filo.filo.com" )
puts "#{User.count} users created"

puts "______________"

puts "Creating offers.."

5.times do
  offer = Offer.new(title: "Finding Nemo",
   description: "do I look like a guy who likes repeating himself?",
   skills_required:"Swimming, Fishing",
   compensation: 50.000,
   fixed_price: true,
   location: "pacific ocean",
   deadline_at: Date.today)
  offer.user = User.first
  offer.save
end

puts "#{Offer.count} offers created"

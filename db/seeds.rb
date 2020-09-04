# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

TITLES = ["Need help with java", "Ruby implementation", "Css job","need an html expert"]
SKILLS = ["CSS", "HTML","Ruby", "Java Script", "Rails", "SQL"]
LOCATIONS = ["Freiburg", "Roma", "Amsterdam", "Sandweiler", "Venezia","Springfield"]


puts "Starting seeds.."
Offer.destroy_all
User.destroy_all

puts "Creating users"
User.create(
  email: "filo.filo@filo.filo",
  password:"filofilo",
  full_name: "Filo Donna",
  user_type: "Developer",
  bio: "I love loving love",
  location: "Naboo",
  phone_number: "3343421236",
  hourly_rate: "50 €",
  headline: "headline",
  business_address: "Business Adress 1234",
  business_name: "Business Name",
  business_vat_id: 5,
  business_size: "50",
  website: "filo.filo.com" )
puts "#{User.count} users created"

puts "______________"

puts "Creating offers.."


15.times do
  offer = Offer.new(
    title: TITLES.sample,
   description: Faker::TvShows::FamilyGuy.quote,
   skills_required: "#{SKILLS.sample}, #{SKILLS.sample}",
   compensation: rand(50000..100000),
   fixed_price: true,
   location: LOCATIONS.sample,
   deadline_at: Date.today)
  offer.user = User.first
  offer.save!
end

puts "#{Offer.count} offers created"

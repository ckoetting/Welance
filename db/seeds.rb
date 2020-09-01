# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Starting seeds.."
User.destroy_all

#User.create(email: "filo.filo@filo.filo", full_name: "Filo Lanza",  ,  dob: 11-01-1993,  , )
User.create(email: "filo.filo@filo.filo", password:"filofilo", full_name: "Filo Donna", user_type: "Developer", bio: "I love loving love", location: "Naboo", phone_number: "3343421236", hourly_rate: "50 €", headline: "headline", business_address: "Business Adress 1234", business_name: "Business Name", business_vat_id: 5, business_size: "50", website: "filo.filo.com" )
puts "#{User.count} users created"

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'
SKILLS = ["CSS", "HTML","Ruby", "Java Script", "Rails", "SQL"]
LOCATIONS = ["Freiburg", "Roma", "Amsterdam", "Sandweiler", "Venezia","Springfield"]


puts "Starting seeds.."
Inquiry.destroy_all
Offer.destroy_all
User.destroy_all

puts "Creating users"
User.create(
  email: "jobs@airbnb.com",
  password:"Test1234",
  full_name: "Brian Chesky",
  user_type: "Business",
  bio: "Experienced Entrepreneur with a demonstrated history of working in the information technology and services industry. Skilled in WordPress, Ruby on Rails, Web Design, Ruby, and Full-Stack Development. Strong business development professional with a Bootcamp focused in Full-Stack Web Developmemt from Le Wagon. ",
  location: "United States",
  phone_number: "0170705047",
  hourly_rate: "1500",
  headline: "Airbnb CEO",
  website: "airbnb.com" ,
  business_address: "888 Brannan St, San Francisco, CA 94103, United States",
  business_name: "Airbnb Inc.",
  business_vat_id: "882948",
  business_size: "6300")
  puts "#{User.count} users created"
  
  puts "______________"
  
  puts "Creating offers.."
  
  
  15.times do
    offer = Offer.new(
      title: Faker::Job.title,
      description: Faker::Lorem.paragraph,
      employment_type: Faker::Job.employment_type,
      skills_required: "#{SKILLS.sample}, #{SKILLS.sample}",
      compensation: rand(50000..100000),
      fixed_price: true,
      location: LOCATIONS.sample,
      deadline_at: Date.today)
      offer.user = User.first
      inquiry = Inquiry.create(offer: offer, user: User.all.sample, message: Faker::Lorem.paragraph)
      
      puts "creating reviews..."
      15.times do
        review = Review.new(
          inquiry: inquiry,
          rating: rand(0..5),
          description: Faker::Lorem.paragraph,
          created_at: rand(1..100).weeks.ago
        )
        review.save!
      end
      
      offer.save!
    end
    
    puts "#{Offer.count} offers created"
    
    puts "creating contacts.."
    15.times do
      contact = Contact.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        message: Faker::Lorem.paragraph,
        created_at: Date.today,
        updated_at: Date.today
      )
      contact.save!
    end
    puts "#{Contact.count} contacts created"
    
    
    
    
    puts "creating chatrooms..."
    15.times do 
      chatroom = Chatroom.new(
        name: Faker::Job.field
      )
      chatroom.save!
      
      
      puts "creating messages..."
      15.times do
        message = Message.new(
          chatroom: chatroom,
          user: User.all.sample,
          content: Faker::Lorem.paragraph,
          created_at: rand(1..100).weeks.ago
        )
        message.save!
        puts "#{Message.count} received"
      end
      
    end
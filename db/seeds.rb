require 'faker'
require 'open-uri'
SKILLS = ["CSS", "HTML","Ruby", "Java Script", "Rails", "SQL"]
LOCATIONS = ["Amsterdam", "Munich", "London", "New York", "Berlin", "Madrid", "Buenos Aires", "Los Angeles", "Paris", "Vancouver", "Toronto", "Seattle", "Lima", "Milano", "Copenhagen"]
JOB_TITLES = ["Junior Ruby Developer", "Senior Frontend Developer", "Data Scientist", "VP of Software", "Product Manager", "Data Scientist", "Senior Ruby Developer", "SQL Developer", "Network Engineer"]
JOB_DESCRIPTION = ["As a Ruby on Rails Developer you will build something meaningful over time to work on large-scale web applications integrating with our dealership management systems. You will need to be able to learn new tools, apps, and environments while displaying the willingness to jump into unfamiliar code bases and start contributing to the team. As a part of the team you will work with cross functional teams of designers and product managers to complete the project in a timely manner.", 
"You will be responsible for the technical design, implementation, and support of features in our cloud-based, multi-tenant automated job scheduling and tracking system. You will be a key player in growing this application and taking it to the next level to handle greater amounts of load volume and scalability. This application is built using Ruby on Rails and Heroku.",
"At Apple, we believe that hard work, a lively environment, creativity, and innovations fuel the ultimate customer experience. We believe each customer interaction is an opportunity to delight, engage, and encourage – and that by focusing on the smallest of details, we can make big impacts with our customers. "]
apple_logo = URI.open('https://res.cloudinary.com/corneliuskf/image/upload/v1599732828/apple-brands_xi3ij3.png')
airbnb_logo = URI.open('https://ebenezersuites.com/wp-content/uploads/2016/06/airbnb-logo-266x300@2x.png')
amazon_logo = URI.open('https://res.cloudinary.com/corneliuskf/image/upload/v1599732880/amazon-brands_oohack.png')
n26_logo = URI.open('https://logodownload.org/wp-content/uploads/2019/10/n26-logo.png')


puts "Starting seeds.."

puts "Creating users"
airbnb = User.create(
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
  apple = User.create(
    email: "jobs@apple.com",
    password:"Test1234",
    full_name: "Tim Cook",
    user_type: "Business",
    bio: "CEO of Apple Inc",
    location: "United States",
    phone_number: "0170705047",
    hourly_rate: "1500",
    headline: "Apple CEO",
    website: "apple.com" ,
    business_address: "One Infinite Loop, Cupertino, CA 95014, United States",
    business_name: "Apple Inc.",
    business_vat_id: "353423",
    business_size: "10000")
    amazon = User.create(
      email: "jobs@amazon.com",
      password:"Test1234",
      full_name: "Jeff Bezon",
      user_type: "Business",
      bio: "CEO of Amazon Inc",
      location: "United States",
      phone_number: "24849284",
      hourly_rate: "1500",
      headline: "Amazon CEO",
      website: "amazon.com" ,
      business_address: "410 Terry Ave N, Seattle, WA 98109, United States",
      business_name: "Amazon Inc.",
      business_vat_id: "003423",
      business_size: "10000+")

      n26 = User.create(
        email: "career@n26.com",
        password:"Test1234",
        full_name: "Valentin Stalf",
        user_type: "Business",
        bio: "CEO of N26 GmbH",
        location: "Germany",
        phone_number: "0170842040",
        hourly_rate: "1500",
        headline: "N26 CEO",
        website: "n26.com" ,
        business_address: "Klosterstraße 62, 10179 Berlin, Germany",
        business_name: "N26 GmbH",
        business_vat_id: "02903",
        business_size: "1000")

    dev1 = User.create(
      email: "dev1@welance.xyz",
      password: "Test1234",
      full_name: Faker::Name.name,
      user_type: "Developer",
      bio: "Full stack Developer",
      location: LOCATIONS.sample,
      phone_number: "5555555",
      hourly_rate: "200",
      headline: "Welance",
      website: "welance.xyz"
    )
    dev2 = User.create(
      email: "dev2@welance.xyz",
      password: "Test1234",
      full_name: Faker::Name.name,
      user_type: "Developer",
      bio: "Full stack Developer",
      location: LOCATIONS.sample,
      phone_number: "5555555",
      hourly_rate: "200",
      headline: "Welance",
      website: "welance.xyz"
    )
  puts "#{User.count} users created"
  DEVELOPERS = [dev1, dev2]
  apple.photo.attach(io: apple_logo, filename: 'apple.png', content_type: 'image/png')
  airbnb.photo.attach(io: airbnb_logo, filename: 'airbnb.png', content_type: 'image/png')
  amazon.photo.attach(io: amazon_logo, filename: 'amazon.png', content_type: 'image/png')
  n26.photo.attach(io: n26_logo, filename: 'n26.png', content_type: 'image/png')

  puts "______________"

  puts "Creating offers.."
  
  
  30.times do
    offer = Offer.new(
      title: JOB_TITLES.sample,
      description: JOB_DESCRIPTION.sample,
      employment_type: Faker::Job.employment_type,
      skills_required: "#{SKILLS.sample}, #{SKILLS.sample}",
      compensation: rand(50000..100000),
      fixed_price: true,
      location: LOCATIONS.sample,
      deadline_at: Date.today)
      offer.user = User.where(user_type: "Business").sample
      
      puts "creating reviews..."
      3.times do
        inquiry = Inquiry.create(
          offer: offer,
          user: DEVELOPERS.sample,
          message: Faker::Quote.famous_last_words,

        )
        review = Review.new(
          inquiry: inquiry,
          rating: rand(0..5),
          description: Faker::Lorem.paragraph,
        )
        review.save!
      end
      
      offer.save!
    end
  


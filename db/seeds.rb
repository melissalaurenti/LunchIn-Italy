# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."

Attendance.destroy_all
Event.destroy_all
UserInterest.destroy_all
EventInterest.destroy_all
Interest.destroy_all
User.destroy_all
City.destroy_all

puts "Creating cities..."

cities = [
  { name: "Roma", country_code: "IT" },
  { name: "Milano", country_code: "IT" },
  { name: "Firenze", country_code: "IT" },
  { name: "Venezia", country_code: "IT" },
  { name: "Napoli", country_code: "IT" },
  { name: "Torino", country_code: "IT" },
  { name: "Bari", country_code: "IT" },
  { name: "Catania", country_code: "IT" },
  { name: "Bologna", country_code: "IT" }
]

cities.each { |city| City.create!(city) }

roma = City.find_by(name: "Roma")
milano = City.find_by(name: "Milano")

puts "Creating interests..."

interest_names = [
  "Career & Development",
  "Community & Exchange",
  "Business & Collaboration",
  "Events & Real-World Encounters",
  "Personal Positioning",
  "Recruiting & Talent Matching",
  "Psychological & Social Aspects",
  "Data & Insights",
  "Special Target Groups"
]

interest_names.each do |name|
  Interest.create!(name: name)
end

puts "Creating users..."

admin = User.create!(
  email: "melissa@example.com",
  password: "password",
  first_name: "Melissa",
  last_name: "Laurenti",
  city: roma,
  role: "admin"
)

ilaria = User.create!(
  email: "ilaria@example.com",
  password: "password",
  first_name: "Ilaria",
  last_name: "Guccini",
  city: roma,
  role: "user"
)

susanne = User.create!(
  email: "susanne@example.com",
  password: "password",
  first_name: "Susanne",
  last_name: "Laurenti",
  city: milano,
  role: "user"
)

alessandra = User.create!(
  email: "alessandra@example.com",
  password: "password",
  first_name: "Alessandra",
  last_name: "Zappalorto",
  city: roma,
  role: "user"
)

users = [ilaria, susanne, alessandra]

puts "Assigning interests to users..."

users.each do |user|
  Interest.order("RANDOM()").limit(3).each do |interest|
    UserInterest.create!(user: user, interest: interest)
  end
end

puts "Creating events..."

event1 = Event.create!(
  title: "Lunch & Networking in Rome 🍝",
  description: "A curated lunch for professionals to connect and exchange ideas.",
  address: "Trastevere, Rome",
  city: roma,
  host: admin,
  capacity: 6,
  starts_at: Time.now + 2.days,
  ends_at: Time.now + 2.days + 2.hours,
  status: "published",
  visibility: "public"
)

event2 = Event.create!(
  title: "Startup Minds Milano 🚀",
  description: "Meet like-minded founders and creatives over lunch.",
  address: "Navigli, Milano",
  city: milano,
  host: admin,
  capacity: 8,
  starts_at: Time.now + 3.days,
  ends_at: Time.now + 3.days + 2.hours,
  status: "published",
  visibility: "public"
)

events = [event1, event2]

puts "Assigning interests to events..."

events.each do |event|
  Interest.order("RANDOM()").limit(2).each do |interest|
    EventInterest.create!(event: event, interest: interest)
  end
end

puts "Creating attendances..."

Attendance.create!(
  user: ilaria,
  event: event1,
  status: "approved"
)

Attendance.create!(
  user: alessandra,
  event: event1,
  status: "approved"
)

Attendance.create!(
  user: susanne,
  event: event2,
  status: "pending"
)

puts "Done! 🎉"

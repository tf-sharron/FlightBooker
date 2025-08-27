# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Clear old data
# db/seeds.rb

# Reset data
Flight.destroy_all
Airport.destroy_all

Passenger.destroy_all
Booking.destroy_all

puts "Seeding airports..."

airport_codes = %w[BFS GLA LHR DUB NYC IBZ MIA LAX]
airports = airport_codes.map { |code| Airport.create!(code: code) }

puts "Created #{Airport.count} airports."

puts "Seeding flights..."

# Grab all airports
departure_airports = Airport.all
arrival_airports   = Airport.all

# Create sample flights
20.times do
  departure = departure_airports.sample
  arrival   = (arrival_airports - [departure]).sample # avoid same airport

  Flight.create!(
    departure_airport: departure,
    arrival_airport: arrival,
    date: Time.now + rand(1..180).days, # random date within 6 months
    duration: rand(60..720) # 1h – 12h in minutes
  )

end

puts "Creating a sample booking with passengers..."

sample_flight = Flight.first

booking = Booking.create!(flight: sample_flight)

Passenger.create!(name: "Sophie", email: "sophie@test.com", booking: booking)
Passenger.create!(name: "Bob",   email: "bob@test.com",   booking: booking)


puts "Creaeted Airports: #{Airport.count}, Flights: #{Flight.count}, Bookings: #{Booking.count}, Passengers: #{Passenger.count}"

puts "✅ Done seeding!"
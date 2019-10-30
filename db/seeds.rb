# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(first_name: "Robert", last_name: "Stringer", email: "user@email.com", password: "password", api_key: "-RpTtG4lr1x2kOEhuNjfKw", api_key_active: true )
garden = Garden.create!(name: "Backyard Raised Bed", latitude: 42.3601, longitude: -71.0589, max_moisture: 40, min_moisture: 20, auto_water: true, user_id: 1)

now = Time.now.to_i
forty_days_ago = now - 3456900
x = 0

until now == forty_days_ago
  garden.env_measurements.create!(humidity: rand(10..60), temperature: rand(20..100), soil_moisture: rand(0..100), created_at: x.minutes.ago)
  now = now - 900
  x = x - 15
end

garden.jobs.create!(name: "water", created_at: 105.minutes.ago)
garden.jobs.create!(name: "water", created_at: 90.minutes.ago)
garden.jobs.create!(name: "water", created_at: 75.minutes.ago)
garden.jobs.create!(name: "water", created_at: 60.minutes.ago)
garden.jobs.create!(name: "water", created_at: 45.minutes.ago)
garden.jobs.create!(name: "photo", created_at: 30.minutes.ago)
garden.jobs.create!(name: "photo", created_at: 29.minutes.ago)
garden.jobs.create!(name: "water", created_at: 28.minutes.ago)
garden.jobs.create!(name: "water", created_at: 15.minutes.ago)
garden.jobs.create!(name: "water", created_at: 13.minutes.ago)

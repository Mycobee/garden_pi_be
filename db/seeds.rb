# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


garden = Garden.create!(name: "Backyard Raised Bed", latitude: 42.3601, longitude: -71.0589)

garden.env_measurements.create!(soil_temperature: 55.52, soil_moisture: 85.33, created_at: 105.minutes.ago)
garden.env_measurements.create!(soil_temperature: 57.28, soil_moisture: 83.22, created_at: 90.minutes.ago)
garden.env_measurements.create!(soil_temperature: 59.11, soil_moisture: 81.11, created_at: 75.minutes.ago)
garden.env_measurements.create!(soil_temperature: 59.92, soil_moisture: 78.47, created_at: 60.minutes.ago)
garden.env_measurements.create!(soil_temperature: 62.43, soil_moisture: 76.82, created_at: 45.minutes.ago)
garden.env_measurements.create!(soil_temperature: 63.88, soil_moisture: 73.90, created_at: 30.minutes.ago)
garden.env_measurements.create!(soil_temperature: 65.55, soil_moisture: 71.02, created_at: 15.minutes.ago)
garden.env_measurements.create!(soil_temperature: 69.33, soil_moisture: 68.86)

require 'rails_helper'

describe "env_measurements api", type: :request do
	before :each do
		@garden = create(:garden)
		@em_1 = create(:env_measurement, garden: @garden)
		@em_2 = create(:env_measurement, garden: @garden)
		@em_3 = create(:env_measurement, garden: @garden)
		@em_4 = create(:env_measurement, garden: @garden)
		@em_5 = create(:env_measurement, garden: @garden)
		@em_6 = create(:env_measurement, garden: @garden)
		@em_7 = create(:env_measurement, garden: @garden)
		@em_8 = create(:env_measurement, garden: @garden)
	end

	it "Sends a garden's associated env_measurements" do
		get "/api/v1/gardens/#{@garden.id}/env_measurements"

		expect(response).to have_http_status(200)
		garden_data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(garden_data.first[:attributes][:humidity]).to eq(@em_1.humidity)
    expect(garden_data.first[:attributes][:temperature]).to eq(@em_1.temperature)
    expect(garden_data.last[:attributes][:soil_moisture]).to eq(@em_8.soil_moisture)
	end

	it "returns 404 for a garden not in the DB" do
		get "/api/v1/gardens/#{@garden.id + 1}/env_measurements"

    expect(response.status).to eq(404)
    error = JSON.parse(response.body, symbolize_names: true)[:error]
    expect(error).to eq("Garden Not Found")
	end

	it "creates an env_measurement" do
		post "/api/v1/gardens/#{@garden.id}/env_measurements", params: {
      "humidity": 45.00,
			"temperature": 55.52,
      "soil_moisture": 85.33
    }

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data][:attributes].count).to eq(4)
    expect(result[:data][:attributes].keys).to eq([:humidity, :temperature, :soil_moisture, :created_at])
	end

	it "doesn't create an env_measurement if param values wrong type" do
		post "/api/v1/gardens/#{@garden.id}/env_measurements", params: {
      "humidity": "thirtyfive",
      "temperature": "fiftyfive",
      "soil_moisture": "eighty"
    }

		expect(response.status).to eq(400)

    expect(response.body).to eq("{ Environment measurements failed to record. }")
	end

	it "auto waters garden if soil_moisture less than garden min_moisture" do
		post "/api/v1/gardens/#{@garden.id}/env_measurements", params: {
      "humidity": 55,
			"temperature": 69.25,
      "soil_moisture": 19
    }

		expect(response.status).to eq(201)

    expect(@garden.jobs[0].name).to eq("auto_water")
	end
end

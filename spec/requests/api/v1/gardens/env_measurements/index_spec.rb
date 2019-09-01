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
	
	it "Sends a garden and its associated env_measurements" do
		get "/api/v1/gardens/#{@garden.id}/env_measurements"

		expect(response).to have_http_status(200)
		garden_data = JSON.parse(response.body, symbolize_names: true)
		expect(garden_data[:garden][:name]).to eq(@garden.name)
		expect(garden_data[:garden][:env_measurements].first[:soilTemperature]).to eq(@em_1.soil_temperature)
		expect(garden_data[:garden][:env_measurements].last[:soilMoisture]).to eq(@em_8.soil_moisture)
	end

	it "returns 404 for a garden not in the DB" do
		expect{
			get "/api/v1/gardens/#{@garden.id + 1}/env_measurements"
		}.to raise_error(ActionController::RoutingError)
	end
end


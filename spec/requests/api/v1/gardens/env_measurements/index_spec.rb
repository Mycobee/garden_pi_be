require 'rails_helper'

describe "env_measurements api", type: :request do
	before :each do
		@garden = create(:garden)
		@em_1 = create(:env_measurement, @garden)	
		@em_2 = create(:env_measurement, @garden)	
		@em_3 = create(:env_measurement, @garden)	
		@em_4 = create(:env_measurement, @garden)	
		@em_5 = create(:env_measurement, @garden)	
		@em_6 = create(:env_measurement, @garden)	
		@em_7 = create(:env_measurement, @garden)	
		@em_8 = create(:env_measurement, @garden)	
	end
	
	it "Sends a garden and its associated env_measurements" do
		get garden_env_measurements_path(@garden)	

		expect(response).to have_http_status(200)
	end
end


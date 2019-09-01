require 'rails_helper'

describe "env_measurements api", type: :request do
	before :each do
		@garden = create(:garden)
		@em_1 = create(:env_measurement, garden: @garden)	
		@em_2 = create(:env_measurement, garden:  @garden)	
		@em_3 = create(:env_measurement, garden:  @garden)	
		@em_4 = create(:env_measurement, garden:  @garden)	
		@em_5 = create(:env_measurement, garden:  @garden)	
		@em_6 = create(:env_measurement, garden:  @garden)	
		@em_7 = create(:env_measurement, garden:  @garden)	
		@em_8 = create(:env_measurement, garden:  @garden)	
	end
	
	it "Sends a garden and its associated env_measurements" do
		get "/api/v1/gardens/#{@garden.id}/env_measurements"

		expect(response).to have_http_status(200)
	end
end


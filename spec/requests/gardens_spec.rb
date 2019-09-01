require 'rails_helper'

RSpec.describe "Gardens", type: :request do
  describe "GET /gardens/:id" do
		before :each do 
			@garden = create(:garden)		
		end

    it "Returns successful with associated env_measurements" do
      get garden_path(@garden)
 
      expect(response).to have_http_status(200)
		
			ga
    end
  end
end

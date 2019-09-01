require 'rails_helper'

RSpec.describe "Gardens", type: :request do
  describe "GET /gardens/:id" do
		before :each do 
			@garden = create(:garden)		
		end

    it "Returns successful" do
 binding.pry
      get garden_path(@garden)

      expect(response).to have_http_status(200)
    end
  end
end

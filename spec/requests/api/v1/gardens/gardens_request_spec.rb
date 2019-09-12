require 'rails_helper'

describe "gardens api", type: :request do
	before :each do
		@garden = create(:garden)
	end

	it "Shows an individual garden" do
		get "/api/v1/gardens/#{@garden.id}"

		expect(response).to have_http_status(200)

		garden_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(garden_data[:id].to_i).to eq(@garden.id)
    expect(garden_data[:attributes][:latitude].to_f).to eq(@garden.latitude)
    expect(garden_data[:attributes][:longitude].to_f).to eq(@garden.longitude)
	end

	it "returns 404 for a garden not in the DB" do
		get "/api/v1/gardens/#{@garden.id + 1}"

    expect(response.status).to eq(404)
    error = JSON.parse(response.body, symbolize_names: true)[:error]
    expect(error).to eq("Garden Not Found")
	end
end

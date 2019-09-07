require 'rails_helper'

describe "jobs api", type: :request do
	before :each do
		@garden = create(:garden)
		@job_1 = create(:job, garden: @garden)
		@job_2 = create(:job, garden: @garden)
		@job_3 = create(:job, garden: @garden)
		@job_4 = create(:job, garden: @garden)
		@job_5 = create(:job, garden: @garden)
		@job_6 = create(:job, garden: @garden)
		@job_7 = create(:job, garden: @garden)
		@job_8 = create(:job, garden: @garden)
	end

	it "Sends a garden's associated jobs" do
		get "/api/v1/gardens/#{@garden.id}/jobs"

		expect(response).to have_http_status(200)
		garden_data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(garden_data.first[:attributes][:name]).to eq(@job_1.name)
	end

	it "returns 404 for a garden not in the DB" do
		get "/api/v1/gardens/#{@garden.id + 1}/jobs"

    expect(response.status).to eq(404)
    error = JSON.parse(response.body, symbolize_names: true)[:error]
    expect(error).to eq("Garden Not Found")
	end

	it "creates an job" do
		post "/api/v1/gardens/#{@garden.id}/jobs", params: {
      "name": "water"
    }

    expect(response).to be_successful

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:data][:attributes].count).to eq(3)
    expect(result[:data][:attributes].keys).to eq([:id, :name, :created_at])
	end

	it "doesn't create an job if param values wrong type" do
		post "/api/v1/gardens/#{@garden.id}/jobs", params: {
      "name": nil
    }

		expect(response.status).to eq(400)

    expect(response.body).to eq("{ Job failed to record. }")
	end
end

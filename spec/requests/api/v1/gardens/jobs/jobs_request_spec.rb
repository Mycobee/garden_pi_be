require 'rails_helper'

describe "jobs api", type: :request do
	before :each do
		@garden = create(:garden)
		@job_1 = create(:job, garden: @garden, created_at: 4.seconds.ago)
		@job_2 = create(:job, garden: @garden, created_at: 5.seconds.ago)
		@job_3 = create(:job, garden: @garden, created_at: 6.seconds.ago)
		@job_4 = create(:job, garden: @garden, created_at: 5.minutes.ago)
		@job_5 = create(:job, garden: @garden, created_at: 15.minutes.ago)
		@job_6 = create(:job, garden: @garden, created_at: 20.minutes.ago)
		@job_7 = create(:job, garden: @garden, created_at: 25.minutes.ago)
		@job_8 = create(:job, garden: @garden, created_at: 900.minutes.ago)
	end

	it "Sends a garden's associated jobs" do
		get "/api/v1/gardens/#{@garden.id}/jobs"

		expect(response).to have_http_status(200)
		garden_data = JSON.parse(response.body, symbolize_names: true)[:data]
    expect(garden_data[0][:attributes][:name]).to eq(@job_1.name)
	end

	it "Returns 404 for a garden not in the DB" do
		get "/api/v1/gardens/#{@garden.id + 1}/jobs"

    expect(response.status).to eq(404)
    error = JSON.parse(response.body, symbolize_names: true)[:error]
    expect(error).to eq("Garden Not Found")
	end

	it "Sends a garden's new jobs" do
		get "/api/v1/gardens/#{@garden.id}/jobs?seconds_ago=5"

		expect(response).to have_http_status(200)
		garden_data = JSON.parse(response.body, symbolize_names: true)[:data]
		expect(garden_data[0][:attributes][:name]).to eq(@job_1.name)
		expect(garden_data[1]).to eq(nil)
		expect(garden_data[2]).to eq(nil)
	end

	it "Returns 400 for garden's new jobs if bad params provided" do
		get "/api/v1/gardens/#{@garden.id}/jobs?seconds_ago=five"

		expect(response).to have_http_status(400)
		expect(response.body).to eq("{ Job request failed. }")
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

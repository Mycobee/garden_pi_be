require 'rails_helper'

describe "gardens api", type: :request do
	before :each do
    @user = create(:user) 
    @user_garden_1 = create(:garden, user: @user) 
    @user_garden_2 = create(:garden, user: @user) 
	end

  # Garden Index Specs
  it "shows all of a user's gardens" do
    headers = { "Authorization": @user.api_key }

		get "/api/v1/gardens", 
		headers: headers

		expect(response).to have_http_status(200)

		garden_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(garden_data.first[:id].to_i).to eq(@user_garden_1.id)
    expect(garden_data.last[:id].to_i).to eq(@user_garden_2.id)
  end
 
  # Garden Show Specs
	it "Shows an individual garden" do
		headers = { "Authorization": @user.api_key }
		get "/api/v1/gardens/#{@user_garden_1.id}",
		headers: headers

		expect(response).to have_http_status(200)

		garden_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(garden_data[:id].to_i).to eq(@user_garden_1.id)
    expect(garden_data[:attributes][:latitude].to_f).to eq(@user_garden_1.latitude.round(4))
    expect(garden_data[:attributes][:longitude].to_f).to eq(@user_garden_1.longitude.round(4))
	end

	it "returns 404 for a garden not in the DB" do
    get "/api/v1/gardens/#{@user_garden_1.id + @user_garden_2.id}"

    expect(response.status).to eq(404)
    error = JSON.parse(response.body, symbolize_names: true)[:error]
    expect(error).to eq("Garden Not Found")
	end

  # Garden Create Specs
	it "Creates a garden" do
    headers = { "Authorization": @user.api_key }

    post "/api/v1/gardens", params: {
      "garden": {
        "name": "Backyard Raised Bed",
        "latitude": 39.742043,
        "longitude": -104.991531,
        "max_moisture": 82.5,
        "min_moisture": 22.5
        }
      },
      headers: headers

		expect(response).to have_http_status(201)

		garden_data = JSON.parse(response.body, symbolize_names: true)[:data]
    new_garden = Garden.last

    expect(garden_data[:id].to_i).to eq(new_garden.id)
    expect(garden_data[:attributes][:latitude].to_f).to eq(new_garden.latitude)
    expect(garden_data[:attributes][:longitude].to_f).to eq(new_garden.longitude)
    expect(garden_data[:attributes][:max_moisture].to_f).to eq(new_garden.max_moisture)
    expect(garden_data[:attributes][:min_moisture].to_f).to eq(new_garden.min_moisture)
    expect(garden_data[:attributes][:auto_water]).to eq(false)
	end

	it "returns 401 for an unauthorized request" do
    headers = { "Authorization": "8675309jenn3" }

    post "/api/v1/gardens", params: {
      "garden": {
        "name": "Backyard Raised Bed",
        "latitude": 39.742043,
        "longitude": -104.991531,
        "max_moisture": 82.5,
        "min_moisture": 22.5,
        "auto_water": "false"
        }
      },
      headers: headers

    expect(response.status).to eq(401)
    error = JSON.parse(response.body, symbolize_names: true)[:error]
    expect(error).to eq("Invalid Credentials")
	end

  it "returns 400 for a bad request" do
    headers = { "Authorization": @user.api_key }

    post "/api/v1/gardens", params: {
      "garden": {
        "name": "Backyard Raised Bed",
        "latitude": "Chicken Nuggets",
        "longitude": -104.991531,
        "max_moisture": 82.5,
        "min_moisture": 22.5,
        "auto_water": "false"
        }
      },
      headers: headers

    expect(response.status).to eq(400)
    error = JSON.parse(response.body, symbolize_names: true)[:error]
    expect(error).to eq("Bad Request")
  end
end

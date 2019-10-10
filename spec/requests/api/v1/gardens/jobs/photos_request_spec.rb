require 'rails_helper'

describe "photos api", type: :request do 

  it "should save photo url to database attached to a garden" do 
    garden = create(:garden)
    post "/api/v1/gardens/#{garden.id}/photos", params: {
      url: "blah@blahblah.blah"
    }
    
    expect(response).to have_http_status(201)
    expect(Photo.last.url).to eq("blah@blahblah.blah")
  end

  it "should return all with all photos with garden" do 
    garden = create(:garden)
    photo_url_1 = create(:photo, garden: garden)
    photo_url_2 = create(:photo, garden: garden)
    get "/api/v1/gardens/#{garden.id}/photos"

    expect(response).to have_http_status(200)
    garden_data = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(garden_data[0][:attributes][:url]).to eq(photo_url_1.url)
    expect(garden_data[1][:attributes][:url]).to eq(photo_url_2.url)
  end

  it "Returns 404 for a garden not in the DB" do
    garden = create(:garden)
		get "/api/v1/gardens/#{garden.id + 1}/photos"

    expect(response.status).to eq(404)
    error = JSON.parse(response.body, symbolize_names: true)[:error]
    expect(error).to eq("Garden Not Found")
  end
end
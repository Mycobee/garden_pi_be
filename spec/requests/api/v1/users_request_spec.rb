require 'rails_helper'

describe 'Users API', type: :request do
  it "creates an account for a user and retruns an api_key" do

    post "/api/v1/users", params: {
      "first_name": "first",
      "last_name": "last",
      "email": "user1@example.com",
      "password": "password",
      "password_confirmation": "password"
      }

    expect(response).to be_successful
    expect(response.status).to eq(201)

    result = JSON.parse(response.body)

    expect(result.values.first.class).to eq(String)
    expect(result.keys).to eq(["api_key"])
  end
end

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

  it "returns api_key if user already exists" do
    user = User.create!( first_name: "first", last_name: "last", email: "user1@example.com", password: "password", password_confirmation: "password")

    post "/api/v1/users", params: {
      "first_name": "first",
      "last_name": "last",
      "email": "user1@example.com",
      "password": "password",
      "password_confirmation": "password"
      }

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values.first.class).to eq(String)
    expect(result.keys).to eq(["api_key"])
  end

  it "doesn't create user if passwords don't match" do
    user = User.create!( first_name: "first", last_name: "last", email: "user1@example.com", password: "password", password_confirmation: "password")

    post "/api/v1/users", params: {
      "first_name": "first",
      "last_name": "last",
      "email": "user1@example.com",
      "password": "password",
      "password_confirmation": "wrong"
      }

    expect(status).to eq(400)

    result = JSON.parse(response.body)
    expect(result).to eq("{ Please check that passwords match. }")
  end

  it "doesn't create user if missing name" do

    post "/api/v1/users", params: {
      "first_name": nil,
      "last_name": "last",
      "email": "user1@example.com",
      "password": "password",
      "password_confirmation": "password"
      }

    expect(status).to eq(400)

    result = JSON.parse(response.body)
    expect(result).to eq("{ Something went wrong. Please try again. }")
  end
end

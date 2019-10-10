require 'rails_helper'

describe 'Users API', type: :request do
  it "creates an account for a user and returns an api_key" do

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
      "password": "password"
      }

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values.first.class).to eq(String)
    expect(result.keys).to eq(["api_key"])
  end

  it "returns api_key regardless of email case" do
    user = User.create!( first_name: "first", last_name: "last", email: "user1@example.com", password: "password", password_confirmation: "password")

    post "/api/v1/users", params: {
      "first_name": "first",
      "last_name": "last",
      "email": "USER1@example.com",
      "password": "password"
      }

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.values.first.class).to eq(String)
    expect(result.keys).to eq(["api_key"])
    expect(User.last).to eq(user)
  end

  it "saves user email as downcased string" do

    post "/api/v1/users", params: {
      "first_name": "first",
      "last_name": "last",
      "email": "USER1@example.com",
      "password": "password"
      }

    expect(User.last.email).to eq(request.params[:email].downcase)
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
    expect(result).to eq("{ Something went wrong. Please ensure matching passwords, valid email, first name, and last name, then try again. }")
  end
end

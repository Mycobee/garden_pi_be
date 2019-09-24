require 'rails_helper'

RSpec.describe "Sessions API" do
  before :each do
    @user = User.create!( first_name: "first", last_name: "last", email: "user1@example.com", password: "password", password_confirmation: "password")
  end

  it "creates a User session" do
    post "/api/v1/sessions", params: {
      "email": @user.email,
      "password": @user.password
      }

    expect(response).to be_successful

    result = JSON.parse(response.body)

    expect(result.keys).to eq(["api_key"])
  end

  it "doesn't create a User session if invalid credentials" do
    post "/api/v1/sessions", params: {
      "email": @user.email,
      "password": "wrong"
      }

    expect(response.status).to eq(401)

    result = JSON.parse(response.body)

    expect(result).to eq("{ Please check that the email and password you've entered are correct. }")
  end

end

require 'rails_helper'

RSpec.describe "Gardens", type: :request do
  describe "GET /gardens" do
    it "works! (now write some real specs)" do
      get gardens_path
      expect(response).to have_http_status(200)
    end
  end
end

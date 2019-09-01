require "rails_helper"

RSpec.describe GardensController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/gardens").to route_to("gardens#index")
    end

    it "routes to #show" do
      expect(:get => "/gardens/1").to route_to("gardens#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/gardens").to route_to("gardens#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/gardens/1").to route_to("gardens#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/gardens/1").to route_to("gardens#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/gardens/1").to route_to("gardens#destroy", :id => "1")
    end
  end
end

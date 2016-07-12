require "rails_helper"

RSpec.describe Api::V1::UsersController, type: :routing do
  describe "routing" do

    it "routes to api/v1/users#index" do
      expect(:get => "/api/v1/users").to route_to("api/v1/users#index")
    end

    it "routes to api/v1/users#me" do
      expect(:get => "/api/v1/users/me").to route_to("api/v1/users#me")
    end

  end
end

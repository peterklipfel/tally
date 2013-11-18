require 'spec_helper'
include FeatureSpecHelpers

describe "Clients" do
  describe "GET /clients" do
    it "allows the user to view index" do
      sign_up_user
      visit clients_path
      page.body.should include("Listing clients")
    end
  end
end

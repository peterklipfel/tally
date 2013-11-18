require 'spec_helper'
include FeatureSpecHelpers

describe "Invoices" do
  describe "GET /invoices" do
    it "allows the user to view the index" do
      sign_up_user
      visit invoices_path
      page.body.should include("Listing invoices")
    end
  end
end

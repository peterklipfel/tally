require 'spec_helper'
include FeatureSpecHelpers

describe "Expenses" do
  describe "GET /expenses" do
    it "allows the user to view the index" do
      sign_up_user
      visit expenses_path
      page.body.should include("Listing expenses")
    end
  end
end

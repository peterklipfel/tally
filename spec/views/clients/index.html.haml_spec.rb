require 'spec_helper'

describe "clients/index" do
  before(:each) do
    assign(:clients, [
      stub_model(Client),
      stub_model(Client)
    ])
  end

  it "renders a list of clients" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end

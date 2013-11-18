require 'spec_helper'

describe "clients/new" do
  before(:each) do
    assign(:client, stub_model(Client).as_new_record)
  end

  it "renders new client form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", clients_path, "post" do
    end
  end
end

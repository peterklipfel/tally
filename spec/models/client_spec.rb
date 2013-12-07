require 'spec_helper'

describe Client do
  it "fails validation with no user" do
    expect(Client.new).to have(1).error_on(:user)
  end
end

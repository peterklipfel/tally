require 'spec_helper'

describe Client do
  it { should respond_to :user }
  it { should respond_to :invoices }

  it "fails validation with no user" do
    expect(Client.new).to have(1).error_on(:user)
  end
end

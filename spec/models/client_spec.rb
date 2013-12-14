# == Schema Information
#
# Table name: clients
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#  user_id    :integer
#

require 'spec_helper'

describe Client do
  it { should respond_to :user }
  it { should respond_to :invoices }

  it "fails validation with no user" do
    expect(Client.new).to have(1).error_on(:user)
  end
end

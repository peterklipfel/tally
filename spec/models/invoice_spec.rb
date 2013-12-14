# == Schema Information
#
# Table name: invoices
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  client_id  :integer
#

require 'spec_helper'

describe Invoice do
  it { should respond_to :expenses }
  it { should respond_to :client }
  it { should_not respond_to :user}

  it "fails validation with no client" do
    expect(Invoice.new).to have(1).error_on(:client)
  end
end

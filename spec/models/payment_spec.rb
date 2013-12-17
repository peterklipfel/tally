# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  amount     :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#  invoice_id :integer
#

require 'spec_helper'

describe Payment do
  it { should respond_to :invoice }

  it "fails validation with no invoice" do
    expect(Payment.new).to have(1).error_on(:invoice)
  end
  it "fails validation with no amount" do
    expect(Payment.new).to have(2).error_on(:amount)
  end
  it "fails validation with non-numeric amount" do
    expect(Payment.new(amount: "one hundred")).to have(1).error_on(:amount)
  end

end

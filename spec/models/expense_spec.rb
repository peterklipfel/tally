# == Schema Information
#
# Table name: expenses
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  task       :string(255)
#  time       :decimal(, )
#  rate       :decimal(, )
#  invoice_id :integer
#

require 'spec_helper'

describe Expense do
  it { should respond_to :invoice }
   it "fails validation with no invoice" do
    expect(Expense.new).to have(1).error_on(:invoice)
  end

  it "calculates total properly" do
    expect(Expense.new(time: 10, rate: 10).total).to eq(100)
  end
end

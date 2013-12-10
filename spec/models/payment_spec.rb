require 'spec_helper'

describe Payment do
  it { should respond_to :expense }

  it "fails validation with no expense" do
    expect(Payment.new).to have(1).error_on(:expense)
  end
  it "fails validation with no amount" do
    expect(Payment.new).to have(2).error_on(:amount)
  end
  it "fails validation with non-numeric amount" do
    expect(Payment.new(amount: "one hundred")).to have(1).error_on(:amount)
  end

end

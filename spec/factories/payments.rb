# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    ignore { user nil }
    expense { FactoryGirl.create(:expense, user: user) }
    amount "9.99"
  end
end

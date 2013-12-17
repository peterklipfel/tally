# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :payment do
    ignore { user nil }
    invoice { FactoryGirl.create(:invoice, user: user) }
    amount "9.99"
  end
end

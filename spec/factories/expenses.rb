# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :expense do
    ignore { user nil }
    invoice { FactoryGirl.create :invoice, user: user}
  end
end

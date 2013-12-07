# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :invoice do
    ignore { user nil }
    client { FactoryGirl.create(:client, user: user) }
  end
end

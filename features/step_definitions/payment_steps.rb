Given(/^the following payments exist:$/) do |table|
  table.hashes.each do |attrs|
    # this requires that the user that is signed in is the first user created
    # super brittle...
    FactoryGirl.create(:payment, amount: attrs["amount"].to_f, user: User.first)
  end
end

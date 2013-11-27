Given(/^there is( not)? a user account with email "([^"]*)"$/) do |not_exists, email|
  if not_exists
    assert User.where(email: email).empty?
  else
    assert !User.where(email: email).empty?
  end
end

Given(/^the following accounts exist:$/) do |table|
  table.hashes.each do |attrs|
    User.create!(attrs.merge({password_confirmation: attrs[:password]}))
  end
end

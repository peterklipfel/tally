Given(/^the following clients exist:$/) do |table|
  table.hashes.each do |attrs|
    Client.create!(attrs)
  end
end
Given(/^the following clients exist:$/) do |table|
  table.hashes.each do |attrs|
    FactoryGirl.create(:client, name: attrs["name"], user: User.first)
  end
end

Given(/^I visit the "(.*?)" page for client with name "(.*?)"$/) do |path, name|
  visit path_to(path, Client.where(name: name).first)
end


Then(/^a client with name "([^"]*)" exists$/) do |name|
  assert(!Client.where(name: name).empty?)
end

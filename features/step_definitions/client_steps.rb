Given(/^the following clients exist:$/) do |table|
  table.hashes.each do |attrs|
    Client.create!(attrs)
  end
end

Given(/^I visit the "(.*?)" page for client with name "(.*?)"$/) do |path, name|
  visit path_to(path, Client.where(name: name).first)
end


Then(/^a client with name "([^"]*)" exists$/) do |name|
  assert(!Client.where(name: name).empty?)
end

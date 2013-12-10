Given(/^the following clients exist:$/) do |table|
  table.hashes.each do |attrs|
    FactoryGirl.create(:client, name: attrs["name"], user: User.first)
  end
end

Given(/^I visit the "(.*?)" page for client with name "(.*?)"$/) do |path, name|
  visit path_to(path, Client.where(name: name).first)
end

Given(/I have a client$/) do 
  FactoryGirl.create(:client, user: User.first)
end

When(/I select a client/) do
  first_option_xpath = "//*/option[1]"
  first_option = find(:xpath, first_option_xpath).text
  select(first)
end

Then(/^a client with name "([^"]*)" exists$/) do |name|
  assert(!Client.where(name: name).empty?)
end

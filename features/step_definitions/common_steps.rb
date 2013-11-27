require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
include NavigationHelper

Given(/^I visit the "([^"]*)" page$/) do |page|
  visit path_to(page)
end

Given(/^I am not signed in$/) do
  page.driver.submit :delete, "/users/sign_out", {}
end

When(/^I click "([^"]*)"$/) do |clickable|
  click_on clickable
end

Then(/^I am on the "([^"]*)" page$/) do |page|
  assert URI.parse(current_url).path == path_to(page)
end


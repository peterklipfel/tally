require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
include NavigationHelper

Given(/^I am on the "([^"]*)" page$/) do |page|
  visit path_to(page)
end

Given(/^I am not signed in$/) do
  page.driver.submit :delete, "/users/sign_out", {}
end

When(/^I click "([^"]*)"$/) do |clickable|
  click_on clickable
end


require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
include NavigationHelper

Given(/^I visit the "([^"]*)" page$/) do |page|
  visit path_to(page)
end

Given(/^I am( not)? signed in$/) do |sign_out|
  if sign_out
    page.driver.submit :delete, "/users/sign_out", {}
  else
    email = 'testing@man.net'
    password = 'secretpass'
    User.new(:email => email, :password => password, :password_confirmation => password).save!

    visit '/users/sign_in'
    fill_in "user_email", :with => email
    fill_in "user_password", :with => password
    click_button "Sign in"
  end
end

When(/^I click "([^"]*)"$/) do |clickable|
  click_on clickable
end

When(/^I click "([^"]*)" within "([^"]*)"$/) do |clickable, wrap|
  puts page.body
  click_on clickable
end

When (/^I fill in "([^"]*)" with "([^"]*)"$/) do |field, value|
  fill_in(field, :with => value)
end

Then(/^I am on the "([^"]*)" page$/) do |page|
  assert URI.parse(current_url).path == path_to(page)
end

Then (/^the page should( not)? contain "([^"]*)"$/) do |not_contain, content|
  if not_contain.nil?
    assert(page.body.include? content)
  else
    assert(!(page.body.include?(content)))
  end
end

Given(/^I visit the "(.*?)" page for the invoice titled "(.*?)"$/) do |page, title|
  visit path_to(page, Invoice.where(title: title).first)
end

Given(/^I create an invoice titled "(.*?)"$/) do |title|
  Invoice.create!(title: title)
end

Then(/^I am on the "(.*?)" page for the invoice titled "(.*?)"$/) do |page, title|
  assert URI.parse(current_url).path == path_to(page, Invoice.where(title: title).first)
end

Then(/^there should be an invoice with the title "([^"]*?)"$/) do |title|
  assert Invoice.where(title: title).empty? == false
end

Given(/^the following invoices exist:$/) do |table|
  table.hashes.each do |attrs|
    Invoice.create!(attrs)
  end
end

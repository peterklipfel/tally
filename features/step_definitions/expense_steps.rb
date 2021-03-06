Given(/^the following expenses exist:$/) do |table|
  table.hashes.each do |attrs|
    # this requires that the user that is signed in is the first user created
    # super brittle...
    FactoryGirl.create(:expense, task: attrs["task"], rate: attrs["rate"], time: attrs["time"], user: User.first)
  end
end

Given(/^I visit the "(.*?)" page for the expense with task "(.*?)"$/) do |path, task|
  visit path_to(path, Expense.where(task: task).first)
end

Then(/^an expense with task "([^"]*)" exists$/) do |task|
  assert(!Expense.where(task: task).empty?)
end

Then(/^an expense with task "([^"]*)" with rate "([^"]*)" exists$/) do |task, rate|
  assert(!Expense.where(task: task, rate: rate).empty?)
end

Then(/^an expense with task "(.*?)" and rate "(.*?)" exists$/) do |task, rate|
  assert(!Expense.where(task: task, rate: rate).empty?)
end


Then(/^an expense with task "([^"]*)" is created$/) do |task|
  assert !Expense.where(task: task).empty?
end

Feature: Allow user to manipulate expenses

Scenario: User can access create expense page
  Given I am signed in
  And the following invoices exist:
  | title                |
  | Bear Hugs 11/30/2013 |
  And I visit the "show invoice" page for the invoice titled "Bear Hugs 11/30/2013"
  When I click "create expense"
  Then I am on the "new expense" page

Scenario: User can create an expense
  Given I am signed in
  And the following invoices exist:
  | title                |
  | Bear Hugs 10/30/2013 |
  And I visit the "show invoice" page for the invoice titled "Bear Hugs 10/30/2013"
  And I click "create expense"
  When I fill in "Task" with "finding bear"
  And I fill in "Time" with "5"
  And I fill in "Rate" with "50"
  And I click "Save"
  Then an expense with task "finding bear" is created

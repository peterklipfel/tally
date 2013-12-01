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
  Then an expense with task "finding bear" exists

Scenario: User can modify an expense
  Given I am signed in
  And the following expenses exist:
  | task          | rate    | time      |
  | catching bear | 50      | 5         |
  And I visit the "edit expense" page for the expense with task "catching bear"
  When I fill in "Rate" with "100"
  And I click "Save"
  Then an expense with task "catching bear" and rate "100" exists

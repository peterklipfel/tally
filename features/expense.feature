Feature: Allow user to manipulate expenses

Scenario: User can access create expense page
  Given I am signed in
  And the following invoices exist:
  | title                |
  | Bear Hugs 11/30/2013 |
  And I visit the "show invoice" page for the invoice titled "Bear Hugs 11/30/2013"
  When I click "create expense"
  Then I am on the "new expense" page
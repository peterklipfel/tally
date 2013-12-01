Feature: Allow user to manipulate payments

Scenario: User can see all payments
Given I am signed in
  And I am on the "home" page
  And the following payments exist:
  | amount |
  | 135.79 |
  | 246.81 |
  When I click "Payments"
  Then the page should contain "135.79"
  And the page should contain "246.81"

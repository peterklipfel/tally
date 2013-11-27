Feature: Allow user to enter application

Scenario: User can access the sign in page
  Given I am not signed in
  And I visit the "home" page
  When I click "Sign in"
  Then I am on the "sign in" page

Scenario: User can access the sign up page
  Given I am not signed in
  And I visit the "home" page
  When I click "Sign up"
  Then I am on the "sign up" page

Scenario: User can sign up
  Given I visit the "sign up" page
  And there is not a user account with email "user@example.com"
  When I fill in "Email" with "user@example.com"
  And I fill in "Password" with "password!"
  And I fill in "Password confirmation" with "password!"
  And I click "Sign up"
  Then there is a user account with email "user@example.com"

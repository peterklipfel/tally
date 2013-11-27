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
  When I fill in "email" with "user@example.com"
  And I fill in "password" with "password!"
  And I fill in "password confirmation" with "password!"
  Then there is a user account with email "user@example.com"

Feature: Allow user to enter application

Scenario: User can access the sign in page
  Given I am not signed in
  And I am on the "home" page
  When I click "Sign in"
  Then I am on the "sign in" page

Scenario: User can access the sign up page
  Given I am not signed in
  And I am on the "home" page
  When I click "Sign up"
  Then I am on the "sign up" page
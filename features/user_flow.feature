Feature: Allow user to enter application

Scenario: User can access the sign in page
  Given I am not signed in
  And I visit the "home" page
  When I click "Returning?"
  Then I am on the "sign in" page

Scenario: User can access the sign up page
  Given I am not signed in
  And I visit the "home" page
  When I click "Get Started"
  Then I am on the "sign up" page

Scenario: User can sign up
  Given I visit the "sign up" page
  And there is not a user account with email "user@example.com"
  When I fill in "Email" with "user@example.com"
  And I fill in "user_password" with "password!"
  And I fill in "user_password_confirmation" with "password!"
  And I click "Sign Up"
  Then there is a user account with email "user@example.com"

Scenario: User can sign in
  Given the following accounts exist:
  | email               | password          |
  | user@example.com    | password!         |
  And I visit the "sign in" page
  When I fill in "Email" with "user@example.com"
  And I fill in "Password" with "password!"
  And I click "Sign In"
  Then there is a user account with email "user@example.com"
  Then I am on the "clients" page

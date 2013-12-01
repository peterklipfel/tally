Feature: Allow user to manage clients

Scenario: User can access see all clients
  Given I am signed in
  And I visit the "home" page
  And the following clients exist:
  | name           |
  | OCaml          |
  | Grandfather Ent|
  When I click "Clients"
  Then the page should contain "OCaml"
  And the page should contain "Grandfather Ent"

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

Scenario: User can modify a client
  Given I am signed in
  And the following clients exist:
  | name             |
  | Upper Playground |
  And I visit the "edit client" page for client with name "Upper Playground"
  When I fill in "Name" with "UP"
  And I click "Save"
  Then a client with name "UP" exists


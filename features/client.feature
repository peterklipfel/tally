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

Scenario: User can create
  Given I am signed in
  And I visit the "new client" page
  When I fill in "Name" with "Carl"
  And I click "Save"
  Then a client with name "Carl" exists

Scenario: User can modify a client
  Given I am signed in
  And the following clients exist:
  | name             |
  | Upper Playground |
  And I visit the "edit client" page for client with name "Upper Playground"
  When I fill in "Name" with "UP"
  And I click "Save"
  Then a client with name "UP" exists

Scenario: User can navigate to the new client page
  Given I am signed in
  And I visit the "clients" page
  When I click "New Client"
  Then I am on the "new client" page

Scenario: User can delete clients
  Given I am signed in
  And the following clients exist:
  | name   |
  | Bill   |
  And I visit the "clients" page
  When I click "Destroy"
  Then I am on the "clients" page
  And the page should not contain "Bill" 

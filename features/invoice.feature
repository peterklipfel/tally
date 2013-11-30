Feature: Allow user to manipulate his or her invoices

Scenario: User can create a new invoice
  Given I am signed in
  And I visit the "new invoice" page
  When I fill in "Title" with "Llama Kisses 11/27/2013"
  And I click "Save"
  Then I am on the "show invoice" page for the invoice titled "Llama Kisses 11/27/2013"
  And there should be an invoice with the title "Llama Kisses 11/27/2013"

Scenario: User can modify an invoice
  Given I am signed in
  And I create an invoice titled "Llama Kisses 12/27/2013"
  And I visit the "edit invoice" page for the invoice titled "Llama Kisses 12/27/2013"
  When I fill in "Title" with "Bear Hugs 12/27/2013"
  And I click "Save"
  Then I am on the "show invoice" page for the invoice titled "Bear Hugs 12/27/2013"

Scenario: User can see all of his invoices
  Given I am signed in
  And I visit the "home" page
  And the following invoices exist:
  | title          |
  | Camel Humps    |
  | Walrus Massage |
  When I click "Invoices"
  Then the page should contain "Camel Humps"
  And the page should contain "Walrus Massage"

Scenario: User can access the new invoice page
  Given I am signed in
  And I visit the "invoices" page
  When I click "New Invoice"
  Then I am on the "new invoice" page
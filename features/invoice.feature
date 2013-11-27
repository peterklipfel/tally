Feature: Allow user to manipulate his or her invoices

Scenario: User can create a new invoice
  Given I am signed in
  And I visit the "new invoice" page
  When I fill in "Title" with "Llama Kisses 11/27/2013"
  And I click "Create invoice"
  Then I should be on the "show invoice" page
  And there should be an invoice with the title "Llama Kisses 11/27/2013"11/27/2013
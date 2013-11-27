Feature: Allow user to manipulate his or her invoices

Scenario: User can create a new invoice
  Given I am signed in
  And I visit the "new invoice" page
  When I fill in "Title" with "Llama Kisses 11/27/2013"
  And I click "Save"
  Then I am on the "show invoice" page for the invoice titled "Llama Kisses 11/27/2013"
  And there should be an invoice with the title "Llama Kisses 11/27/2013"

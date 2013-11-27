class AddClientAndUserAssociationsToInvoices < ActiveRecord::Migration
  def change
    add_reference :invoices, :client, index: true
    add_reference :invoices, :user, index: true
  end
end

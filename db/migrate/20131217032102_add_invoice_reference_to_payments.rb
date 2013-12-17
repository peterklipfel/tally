class AddInvoiceReferenceToPayments < ActiveRecord::Migration
  def change
    add_reference :payments, :invoice, index: true
  end
end

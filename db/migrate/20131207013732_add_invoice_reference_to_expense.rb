class AddInvoiceReferenceToExpense < ActiveRecord::Migration
  def change
    add_reference :expenses, :invoice, index: true
  end
end

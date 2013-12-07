class RemoveUserReferenceFromInvoices < ActiveRecord::Migration
  def change
    remove_reference :invoices, :user, index: true
  end
end

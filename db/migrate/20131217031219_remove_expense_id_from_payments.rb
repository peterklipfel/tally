class RemoveExpenseIdFromPayments < ActiveRecord::Migration
  def change
    remove_reference :payments, :expense, index: true
  end
end

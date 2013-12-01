class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.reference :expense
      t.decimal :amount

      t.timestamps
    end
  end
end

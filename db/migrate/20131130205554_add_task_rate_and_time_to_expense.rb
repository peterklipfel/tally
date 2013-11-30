class AddTaskRateAndTimeToExpense < ActiveRecord::Migration
  def change
    add_column :expenses, :task, :string
    add_column :expenses, :time, :decimal
    add_column :expenses, :rate, :decimal
  end
end

# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  expense_id :integer
#  amount     :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class Payment < ActiveRecord::Base
  belongs_to :expense

  validates :expense, :amount, presence: true
  validates :amount, numericality: true

  # The following version of the scope does not work currently because there is a bug in
  # rails core.  I have requested that an issue be reopened at https://github.com/rails/rails/issues/3002
  # scope :all_for_user, -> (user_id) { Payment.joins(:expense).load.merge Expense.all_for_user(user_id) }

  scope :all_for_user, -> (user_id) { Expense.all_for_user(user_id).collect { |e| e.payments }.to_a.flatten }
end

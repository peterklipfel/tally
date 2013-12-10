class Payment < ActiveRecord::Base
  belongs_to :expense

  validates :expense, :amount, presence: true
  validates :amount, numericality: true

  scope :all_for_user, -> (user_id) { Payment.joins(:expense).load.merge Expense.all_for_user(user_id) }
end

#== Represents a billable entitity that will be added to an invoice
class Expense < ActiveRecord::Base
  belongs_to :invoice
  has_many :payments
  
  scope :all_for_user, -> (user_id) { Expense.joins(:invoice).load.merge Invoice.all_for_user(user_id) }
end

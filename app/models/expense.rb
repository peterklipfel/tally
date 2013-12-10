#== Represents a billable entitity that will be added to an invoice
class Expense < ActiveRecord::Base
  belongs_to :invoice
  has_many :payments
  
  validates_presence_of :invoice

  scope :all_for_user, -> (user_id) { Expense.joins(:invoice).load.merge Invoice.all_for_user(user_id) }
end

#== Represents a billable entitity that will be added to an invoice
class Expense < ActiveRecord::Base
  belongs_to :invoice
  has_many :payments
end

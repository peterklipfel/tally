class Payment < ActiveRecord::Base
  belongs_to :expense

  validates :expense, :amount, presence: true
  validates :amount, numericality: true
end

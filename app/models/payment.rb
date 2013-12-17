# == Schema Information
#
# Table name: payments
#
#  id         :integer          not null, primary key
#  amount     :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#  invoice_id :integer
#

class Payment < ActiveRecord::Base
  belongs_to :invoice

  validates :invoice, :amount, presence: true
  validates :amount, numericality: true
  
  scope :all_for_user, -> (user_id) { Payment.joins(:invoice).load.merge Invoice.all_for_user(user_id) }
end

# == Schema Information
#
# Table name: invoices
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  title      :string(255)
#  client_id  :integer
#

# == An invoice that will be sent to a client
class Invoice < ActiveRecord::Base
  has_many :expenses
  has_one :payment
  belongs_to :client
  validates_presence_of :client
  scope :all_for_user, -> (user_id) { Invoice.joins(:client).load.merge Client.all_for_user(user_id) }
  def total
    expenses.map(&:total).inject(0.0) { |a, b| a + b }
  end
end

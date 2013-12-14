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
  belongs_to :client

  validates_presence_of :client

  scope :all_for_user, -> (user_id) { Invoice.joins(:client).load.merge Client.all_for_user(user_id) }
end

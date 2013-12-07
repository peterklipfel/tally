#== An invoice that will be sent to a client
class Invoice < ActiveRecord::Base
  has_many :expenses
  belongs_to :client

  validates_presence_of :client

  scope :all_for_user, -> (user_id) { Invoice.joins(:client).scoped.merge Client.all_for_user1(user_id) }
end

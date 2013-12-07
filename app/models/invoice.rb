#== An invoice that will be sent to a client
class Invoice < ActiveRecord::Base
  has_many :expenses
  belongs_to :client

  validates_presence_of :client
end

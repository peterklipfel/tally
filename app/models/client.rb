#== Represents a client that will receive invoices
class Client < ActiveRecord::Base
  belongs_to :user
  has_many :invoices

  validates_presence_of :user
end

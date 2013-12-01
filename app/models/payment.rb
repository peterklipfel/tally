class Payment < ActiveRecord::Base
  belongs_to :expense
end

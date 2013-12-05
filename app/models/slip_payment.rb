class SlipPayment < ActiveRecord::Base
  attr_accessible :amount, :name, :receipt_id, :type
end

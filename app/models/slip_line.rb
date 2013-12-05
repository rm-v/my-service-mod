class SlipLine < ActiveRecord::Base
  attr_accessible :amount, :discount, :discount_type, :name, :price, :tax_rate
end

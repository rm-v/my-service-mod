class Service < ActiveRecord::Base
  attr_accessible :branch_id, :description, :duration, :name, :price, :trade_id
end

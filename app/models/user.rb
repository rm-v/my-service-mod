class User < ActiveRecord::Base
  attr_accessible :branch_id, :email, :first_name, :last_name, :password
end

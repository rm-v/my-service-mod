class Receipt < ActiveRecord::Base
  attr_accessible :branch_id, :cashbox, :cashier_name, :error_note, :printing_state, :reference
end

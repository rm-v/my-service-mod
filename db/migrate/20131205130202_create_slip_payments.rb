class CreateSlipPayments < ActiveRecord::Migration
  def change
    create_table :slip_payments do |t|
      t.decimal :amount
      t.string :name
      t.string :type
      t.integer :receipt_id

      t.timestamps
    end
  end
end

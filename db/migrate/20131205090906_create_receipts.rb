class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.string :cashbox
      t.string :cashier_name
      t.string :error_note
      t.string :printing_state
      t.string :reference
      t.integer :branch_id

      t.timestamps
    end
  end
end

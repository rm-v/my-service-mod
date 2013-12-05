class CreateSlipLines < ActiveRecord::Migration
  def change
    create_table :slip_lines do |t|
      t.decimal :amount
      t.decimal :discount
      t.string :discount_type
      t.string :name
      t.decimal :price
      t.string :tax_rate

      t.timestamps
    end
  end
end

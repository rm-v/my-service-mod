class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.integer :branch_id
      t.text :description
      t.integer :duration
      t.integer :trade_id
      t.integer :price

      t.timestamps
    end
  end
end

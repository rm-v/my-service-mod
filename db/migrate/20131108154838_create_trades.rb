class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string :name
      t.integer :branch_id
      t.text :description

      t.timestamps
    end
  end
end

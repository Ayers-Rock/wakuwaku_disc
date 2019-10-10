class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.integer :item_id, null: false
      t.integer :arrival_count, null: false
      t.date :arrival_date, null: false

      t.timestamps
    end
  end
end

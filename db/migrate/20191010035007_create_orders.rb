class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id, null: false
      t.string :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city_address, null: false
      t.string :building, null: false
      t.integer :total_price, null: false
      t.integer :payment, null: false
      t.integer :status, null: false
      t.integer :postage, null: false
      t.string  :delivery_first_name
      t.string  :delivery_last_name
      t.string  :delivery_first_kana_name
      t.string  :delivery_last_kana_name
      t.string  :order_number

      t.timestamps
    end
  end
end

class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_kana_name, null: false
      t.string :last_kana_name, null: false
      t.string :postal_code
      t.string :prefecture
      t.string :city_address
      t.string :building

      t.timestamps
    end
  end
end

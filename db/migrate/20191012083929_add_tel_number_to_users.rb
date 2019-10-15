class AddTelNumberToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tel_number, :string
  end
end

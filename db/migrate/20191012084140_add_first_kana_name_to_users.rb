class AddFirstKanaNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_kana_name, :string
  end
end

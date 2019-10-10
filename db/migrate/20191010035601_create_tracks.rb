class CreateTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :tracks do |t|
      t.integer :disc_id, null: false
      t.integer :track_number, null: false
      t.string :track_name, null: false

      t.timestamps
    end
  end
end

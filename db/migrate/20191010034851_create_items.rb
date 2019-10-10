class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :artist_id, null: false
      t.integer :label_id, null: false
      t.integer :genre_id, null: false
      t.string :title, null: false
      t.string :jacket_image_id, null: false
      t.integer :price, null: false
      t.integer :status, null: false
      t.datetime :deleted_at

      t.timestamps
    end
  end
end

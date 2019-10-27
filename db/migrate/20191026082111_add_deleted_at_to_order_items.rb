class AddDeletedAtToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :deleted_at, :datetime
  end
end

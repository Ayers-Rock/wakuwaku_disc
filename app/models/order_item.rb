class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :item
    after_save do |order_item|
      order_item.item.update(status: 2) if order_item.item.stock <= 0
    end

    def total_price
		#good.price * quantity
  end
  acts_as_paranoid

  def with_deleted_item
    correct_item = nil
    Item.with_deleted.each do |item|
      correct_item = item if item.id == self.item_id
    end
    correct_item
  end
end

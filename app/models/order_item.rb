class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :item

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

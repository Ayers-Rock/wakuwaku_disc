class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :item
    after_save do |order_item|
      order_item.item.update(status: 2) if order_item.item.stock <= 0
    end

    def total_price
		#good.price * quantity
	end
end

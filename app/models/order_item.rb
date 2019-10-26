class OrderItem < ApplicationRecord
    belongs_to :order
    belongs_to :item

    def total_price
		#good.price * quantity
  end
  acts_as_paranoid
end

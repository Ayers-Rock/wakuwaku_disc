class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items, dependent: :destroy
    after_save { self.order_number = self.id.to_s + SecureRandom.hex(3).to_s }
    enum status: { preparing: 0, in_delivery: 1, delivered: 2 }
    enum payment: { cod: 0, transfar: 1, credit_card: 2 }

    validates :postal_code, presence: true

    def total_price
        sum = 0
        order_items.each do |order_item|
          sum += order_item.purchase_price * order_item.amount * 1.10
        end
        return sum + 500
      end
      def connected_address
        address = self.postal_code + " " + self.prefecture + " "  + self.city_address + " " + self.building
        return address
    end
end

class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items
    after_save { self.order_number = self.id.to_s + SecureRandom.hex(3).to_s }
    enum status: { preparing: 0, in_delivery: 1, delivered: 2 }
    enum payment: { cod: 0, transfer: 1, credit_card: 2 }

    validates :postal_code, presence: true
    validates :prefecture, presence: true
    validates :city_address, presence: true
    validates :delivery_first_name, format: { with: /\A[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 10 },presence: true
    validates :delivery_last_name, format: { with: /\A^[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 10 },presence: true
#全角カタカナ
    validates :delivery_first_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 10 },presence: true
    validates :delivery_last_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 10 },presence: true
    acts_as_paranoid

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

      def amount_except_one
        sum = 0
        order_items.each do |order_item|
          sum += order_item.amount
        end
        return sum - 1
      end

end

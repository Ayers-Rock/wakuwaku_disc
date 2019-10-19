class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items, dependent: :destroy
    # before_save { self.status = 0 }
    # ↑こういう書き方もあります
    enum status: { preparing: 0, in_delivery: 1, delivered: 2 }
end

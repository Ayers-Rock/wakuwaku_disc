class Order < ApplicationRecord
    belongs_to :user
    has_many :order_items, dependent: :destroy
    # before_save { self.status = 0 }
    # ↑こういう書き方もあります

end

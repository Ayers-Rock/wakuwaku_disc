class CartItem < ApplicationRecord
    belongs_to :item
    belongs_to :user

    acts as paranoia
end

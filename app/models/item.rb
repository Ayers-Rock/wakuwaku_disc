class Item < ApplicationRecord
    has_many :stocks
    has_many :discs
    has_many :cart_items
    has_many :reviews
    has_many :favorites
    has_many :order_items

    belongs_to :genre
    belongs_to :label
    belongs_to :artist
end

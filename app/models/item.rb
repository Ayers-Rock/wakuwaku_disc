class Item < ApplicationRecord
    has_many :stocks

    has_many :discs
    accepts_nested_attributes_for :discs
    # , allow: true

    has_many :cart_items
    has_many :reviews
    has_many :favorites
    has_many :order_items

    belongs_to :genre
    belongs_to :label
    belongs_to :artist

    attachment :jacket_image
    enum status: {"販売中": 0, "販売停止中": 1}
end

class Item < ApplicationRecord
    has_many :stocks
    accepts_nested_attributes_for :stocks, allow_destroy: true
    has_many :discs
    accepts_nested_attributes_for :discs, allow_destroy: true
    has_many :cart_items
    has_many :reviews
    has_many :favorites
    has_many :order_items

    belongs_to :genre
    accepts_nested_attributes_for :genre, allow_destroy: true
    belongs_to :label
    accepts_nested_attributes_for :label, allow_destroy: true
    belongs_to :artist
    accepts_nested_attributes_for :artist, allow_destroy: true


end

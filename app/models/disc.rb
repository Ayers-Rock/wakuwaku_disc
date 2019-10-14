class Disc < ApplicationRecord
    belongs_to :item

    has_many :tracks, dependent: :destroy
    accepts_nested_attributes_for :tracks
    # , allow: true
end

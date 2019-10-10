class Disc < ApplicationRecord
    belongs_to :item

    has_many :tracks, dependent: :destroy
end

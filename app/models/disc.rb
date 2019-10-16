class Disc < ApplicationRecord
    belongs_to :item

    has_many :tracks, dependent: :destroy
    accepts_nested_attributes_for :tracks, allow_destroy: true

    default_scope -> { order(disc_number: :asc) }

end

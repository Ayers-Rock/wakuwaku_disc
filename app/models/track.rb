class Track < ApplicationRecord
    belongs_to :disc

    default_scope -> { order(track_number: :asc) }
end

class Stock < ApplicationRecord
    belongs_to :item

    validates :arrival_count, presence: true
    validates :arrival_date, presence: true
end

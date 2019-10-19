class Stock < ApplicationRecord
    belongs_to :item

    validates :arrival_count, presence: true
    validates :arrival_date, presence: true

    def stock_sum(item)
        stock_total = Stock.where(item_id: item.id).sum(:arrival_count)
    end
end

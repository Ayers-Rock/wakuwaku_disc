class Review < ApplicationRecord
    belongs_to :item
    belongs_to :user

    validates :title, presence: true, length: { minimum: 1 }
    validates :body, presence: true, length: { minimum: 5 }
end

class Item < ApplicationRecord
    has_many :stocks

    has_many :discs
    accepts_nested_attributes_for :discs, allow_destroy: true

    has_many :cart_items
    has_many :reviews
    has_many :favorites, dependent: :destroy
    has_many :order_items

    belongs_to :genre
    belongs_to :label
    belongs_to :artist

    attachment :jacket_image
    enum status: {available: 0, not_available: 1}

    validates :title, presence: true
    # validates :jacket_image_id, presence: true, file_content_type: { allow: ['image/jpeg', 'image/png'] }
    validates :price, presence: true
    validates :status, presence: true

    acts_as_paranoid without_default_scope: true

    def favorited_by?(current_user)
        favorites.where(user_id: current_user.id).exists?
    end

end

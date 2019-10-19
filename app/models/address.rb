class Address < ApplicationRecord
    belongs_to :user

    def connected_address
        self.postal_code + " " + self.prefecture + " "  + self.city_address + " " + self.building
    end
    # before_save { self.email = email.downcase }
  # nameの文字数は、1文字から10文字まで
  #全角ひらがな、漢字
#   validates :first_name, format: { with: /\A[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 10 },
#     presence: true
#   validates :last_name, format: { with: /\A^[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 10 },
#     presence: true
# #全角カタカナ
#   validates :first_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 10 },
#     presence: true
#   validates :last_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 10 },
#     presence: true




  #postal_codeは、数字３桁＋ハイフン＋数字４桁の形式
    validates :postal_code, presence: false, format: { with: /\A(\d{7}|^$)\z/ }
    # validates :prefecture
    # validates :city_address
    # validates :building
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end

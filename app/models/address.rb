class Address < ApplicationRecord
    belongs_to :user

    def connected_address
        address = self.postal_code + " " + self.prefecture + " "  + self.city_address + " " + self.building
        return address
    end
    def delivery_destination
        self.last_name + " " + self.first_name + " " + connected_address
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




  #postal_codeは、数字３桁＋数字４桁の形式
    validates :postal_code, presence: true, format: { with: /\A(\d{7}|^$)\z/ }
    validates :prefecture, presence: true
    validates :city_address, presence: true
    validates :building, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
end

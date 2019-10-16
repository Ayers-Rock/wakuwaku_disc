class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  before_save { self.email = email.downcase }
  # nameの文字数は、1文字から10文字まで
  #全角ひらがな、漢字
  validates :first_name, format: { with: /\A[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 10 },
    presence: true
  validates :last_name, format: { with: /\A^[一-龥ぁ-ん]+\z/ }, length: { minimum: 1, maximum: 10 },
    presence: true
#全角カタカナ
  validates :first_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 10 },
    presence: true
  validates :last_kana_name, format: { with: /\A^([ァ-ン]|ー)+$\z/ }, length: { minimum: 1, maximum: 10 },
    presence: true

#tel_numberは、ハイフンなしの数字11桁
  validates :tel_number, format: { with: /\A\d{11}\z/ },
    presence: true
#emailは、30文字まで
  validates :email, format: { with: /\A\S+@\S+\.\S+\z/ }, length: { maximum: 40 },
    presence: true
#半角アルファベット（大文字小文字数値）


#postal_codeは、数字３桁＋ハイフン＋数字４桁の形式
  validates :postal_code, presence: false, format: { with: /\A(\d{3}-\d{4}|^$)\z/ }
  # validates :prefecture
  # validates :city_address
  # validates :building
# Include default devise modules. Others available are:
# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

end

class User < ApplicationRecord
  before_save { self.email = email.downcase }
  #nameの文字数は、1文字から10文字まで
  #全角ひらがな、漢字
#   validates :first_name,#　format: { with: /^[一-龥ぁ-ん]/ }, lenght: { minimum: 1, maximum: 10 },
#     presence: true
#   validates :last_name,# format: { with: /^[一-龥ぁ-ん]/ }, lenght: { minimum: 1, maximum: 10 },
#     presence: true
# 　#全角カタカナ
#   validates :first_kana_name,# format: { with: /^([ァ-ン]|ー)+$/ }, lenght: { minimum: 1, maximum: 10 },
#     presence: true
#   validates :last_kana_name,# format: { with: /^([ァ-ン]|ー)+$/ }, lenght: { minimum: 1, maximum: 10 },
#     presence: true

#   #tel_numberは、ハイフンなしの数字11桁
#   validates :tel_number,# format: { with: /\A\d{11}\z/ },
#     presence: true
# 　#emailは、30文字まで
#   validates :email,# format: { with: /\A\S+@\S+\.\S+\z/ }, lenght: { maximum: 40 },
#     presence: true
#   #半角アルファベット（大文字小文字数値）
#   validates :password,# format: { with: /\A[a-zA-Z0-9]+\z/ },
#     presence: true

#   #postal_codeは、数字３桁＋ハイフン＋数字４桁の形式
#   validates :postal_code#, format: { with: /\A\d{3}[-]\d{4}\z/ }

#   validates :prefecture
#   validates :city_address
#   validates :building
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

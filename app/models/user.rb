class User < ApplicationRecord
  before_save { self.email = email.downcase }
  #nameの文字数は、1文字から10文字まで
  #全角ひらがな、漢字
  validate :first_name,　format: { with: /^[一-龥ぁ-ん]/ } lenght: { minimum: 1, maximum: 10 }
    presence: true
  validate :last_name, format: { with: /^[一-龥ぁ-ん]/ } lenght: { minimum: 1, maximum: 10 }
    presence: true
　#全角カタカナ
  validate :first_kana_name, format: { with: /^([ァ-ン]|ー)+$/ } lenght: { minimum: 1, maximum: 10 }
    presence: true
  validate :last_kana_name, format: { with: /^([ァ-ン]|ー)+$/ } lenght: { minimum: 1, maximum: 10 }
    presence: true

  #tel_numberは、ハイフンなしの数字11桁
  validate :tel_number, format: { with: /\A\d{11}\z/ } 
    presence: true
　#emailは、30文字まで
  validate :email, format: { with: /^\S+@\S+\.\S+$ } lenght: { maximum: 30 }
    presence: true
  #半角アルファベット（大文字小文字数値）
  validate :password, format: { with:/\A[a-zA-Z0-9]+\z/ }
    presence: true

  #postal_codeは、数字３桁＋ハイフン＋数字４桁の形式
  validate :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/ }

  validate :prefe_cture
  validate :city_address
  validate :building
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end

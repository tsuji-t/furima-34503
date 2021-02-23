class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :last_name_full, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } 
  validates :first_name_full, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } 
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶ]+\z/ } 
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶ一]+\z/ } 
  validates :birthday, presence: true

end
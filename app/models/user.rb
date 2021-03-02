class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/ } do
    validates :last_name_full
    validates :first_name_full
  end

  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/ } do
    validates :last_name_kana
    validates :first_name_kana
  end
  
  with_options presence: true do
    validates :birthday
    validates :nickname
  end

  validates :password, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }

  has_many :items
  has_many :histories

end
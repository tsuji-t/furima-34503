class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipping
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :state
  belongs_to_active_hash :arrival

  with_options presence: true do
    validates :title
    validates :explanation
    validates :image
  end

  with_options numericality: { other_than: 1, message: "を入力して下さい。" }  do
    validates :category_id
    validates :status_id
    validates :shipping_id
    validates :state_id
    validates :arrival_id
  end

  validates :price, inclusion: { in: 300..9999999, message: "が不正な値です。" }, format: { with: /\A[0-9]+\z/, message: "を入力して下さい。" }

  has_one_attached :image
  belongs_to :user
  has_one :history
  
end

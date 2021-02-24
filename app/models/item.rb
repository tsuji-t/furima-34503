class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :deliveryfee
  belongs_to :state
  belongs_to :deliveryday

  with_options presence: true do
    validates :title
    validates :explanation
    validates :image
  end

  with_options numericality: { other_than: 1 }  do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id 
    validates :state_id
    validates :delivery_day_id
  end

  validates :price, inclusion: { in: 300..9999999 }, format: { with: /\A[0-9]+\z/ }

  has_one_attached :image
  belongs_to :user
  
end

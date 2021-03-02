class HistoryOrder
  include ActiveModel::Model
  attr_accessor :postal, :state_id, :city, :address, :building, :phone, :history_id, :user_id, :item_id, :token

  with_options presence: true do
    validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :city
    validates :address
    validates :phone
    validates :user_id
    validates :item_id
    validates :token
  end 

  validates :state_id, numericality: { other_than: 1 }

  def save
    history = History.create(user_id: user_id, item_id: item_id)
    Order.create(postal: postal, state_id: state_id, city: city, address: address, building: building, phone: phone, history_id: history.id)
  end
  
end

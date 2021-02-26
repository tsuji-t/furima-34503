class Deliveryfee < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '出品者が負担' },
    { id: 3, name: '購入者が負担' },
   
  ]


  include ActiveHash::Associations
  has_many :item
end

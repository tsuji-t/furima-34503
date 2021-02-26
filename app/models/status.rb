class Status < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '新品' },
    { id: 3, name: '中古・傷なし' },
    { id: 4, name: '中古・傷あり' },
   
  ]


  include ActiveHash::Associations
  has_many :items
end

class Arrival < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '１〜２日' },
    { id: 3, name: '３〜４日' },
    { id: 4, name: '５〜７日' },
  ]


  include ActiveHash::Associations
  has_many :items
end

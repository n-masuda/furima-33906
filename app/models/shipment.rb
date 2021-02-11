class Shipment < ActiveHash::Base
  self.data = [
    {id: 0, name: '選択してください'},
    {id: 1, name: '明日発送'}, {id: 2, name: '2~3日で発送'}, {id: 3, name: '1週間以内に発送'},
    {id: 4, name: '2週間以内に発送'}
  ]
  include ActiveHash::Associations
  has_many :items

end
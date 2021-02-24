class DeliveryFee < ActiveHash::Base
  self.data = [
    { id: 0, name: '選択してください' },
    { id: 1, name: '送料込み' }, { id: 2, name: '着払い' }

  ]

  include ActiveHash::Associations
  has_many :items
end

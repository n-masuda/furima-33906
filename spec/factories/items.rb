FactoryBot.define do
  factory :item do
    name { '２０１２年発売CD　Rhymestar ★マニフェスト★' }
    text { '世界一ダサいジャケット' }
    shipment_id { 1 }
    category_id { 1 }
    status_id { 1 }
    delivery_fee_id { 1 }
    prefecture_id { 1 }
    price { Faker::Number.number(digits: 7) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end

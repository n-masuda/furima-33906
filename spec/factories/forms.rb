FactoryBot.define do
  factory :form do
    postal_code { '103-0021' }
    city { '中央区' }
    add_line1 { '日本橋本石町2-1-1' }
    phone { '0332791111' }
    prefecture_id { '1' }
    token { 'ch_2cb4fb74563dea78ef00582793b52' }
  end
end

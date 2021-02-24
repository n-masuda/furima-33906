class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '選択してください' },
    { id: 1, name: 'ファッション' }, { id: 2, name: 'ベビー' }, { id: 3, name: 'インテリア' },
    { id: 4, name: '本・音楽・映画' }, { id: 5, name: 'ゲーム・ホビー' }, { id: 6, name: '美容・コスメ' },
    { id: 7, name: '電化製品' }, { id: 8, name: 'スポーツ・アウトドア' }, { id: 9, name: 'その他' }

  ]

  include ActiveHash::Associations
  has_many :items
end

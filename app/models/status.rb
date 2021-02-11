class Status < ActiveHash::Base
  self.data = [
    {id: 0, name: '選択してください'},
    {id: 1, name: '新品'}, {id: 2, name: '新古品'}, {id: 3, name: '中古(美品)'},
    {id: 4, name: '中古(良品)'}, {id: 5, name: '中古(傷・汚れあり)'}, {id: 6, name: '中古(ジャンク品)'},
  ]
  include ActiveHash::Associations
  has_many :items

end
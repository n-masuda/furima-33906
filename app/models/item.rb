class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :deliveryfee
  belongs_to :prefecture
  belongs_to :shipment
  belongs_to :user

  has_one_attached :image

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 0 }
  validates :status_id, presence: true, numericality: { other_than: 0 }
  validates :delivery_fee_id, presence: true, numericality: { other_than: 0 }
  validates :prefecture_id, presence: true, numericality: { other_than: 0 }
  validates :price, presence: true, numericality: { only_integer:true,gather_than:300,less_than:9999999} 
  validates :shipment_id, presence: true, numericality: { other_than: 0 }
end


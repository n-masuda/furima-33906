class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :category
  belongs_to :status
  belongs_to :deliveryfee
  belongs_to :prefecture
  belongs_to :shipment
  belongs_to :user

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true

  with_options presence: true, numericality: { other_than: 0, message: 'Select'} do
    validates :shipment_id
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
  end

  validates :price, presence: true, only_integer: true, numericality: { gather_than:300,less_than:9999999} 



end


class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one :order

  belongs_to :category
  belongs_to :status
  belongs_to :deliveryFee
  belongs_to :prefecture
  belongs_to :shipment
  belongs_to :user

  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true

  with_options presence: true, numericality: { other_than: 0, message: "can't be blank"} do
    validates :shipment_id
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :prefecture_id
  end

  validates :price, presence: true, numericality: { only_integer:true, greater_than:299,less_than:10000000} 



end


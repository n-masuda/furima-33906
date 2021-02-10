class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true
  validates :shipment_id, presence: true
  private

  def item_params
    params.require(:item).permit(:name, :text, :category_id, :status_id, delivery_fee_id, :prefecture_id, :price, :shipment_id, :image).merge(user_id: current_user.id)
  end
end

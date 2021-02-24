class Form
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :city, :add_line1, :add_line2, :phone, :prefecture_id, :order_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: 'incorrect' }
    validates :city
    validates :add_line1
    validates :phone, length: { maximum: 11 }, numericality: { only_integer: true }
    validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Purchase.create(postal_code: postal_code, city: city, add_line1: add_line1, add_line2: add_line2, phone: phone, prefecture_id: prefecture_id, order_id: order.id)
  end
end

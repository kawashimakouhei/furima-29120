class UserOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :order_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :phone_number, numericality: { with: /\A\d{1,2,3,4,5,6,7,8,9,10,11}\z/, message: "is out of setting range" }
    validates :city
    validates :house_number
    validates :token
  end
    validates :prefecture, numericality: { other_than: 1, message: "can't be blank" }
  def save
    #Order.create(item_id: item_id, user_id: user_id)
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, prefecture: prefecture, city: city, house_number: house_number, building_name: building_name, order_id: order.id)
  end
  
end



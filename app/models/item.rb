class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day_to_ship
  has_one_attached :image
  belongs_to :user
  has_one :order
  has_one :Address

  with_options presence: true do
   validates :title
   validates :text
   validates :image
   validates :price
   validates :category_id, :condition_id, :shipping_id, :prefecture_id, :day_to_ship_id, numericality: {other_than: 1, message: "can't be blank"}
   validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}
   validates :price, format: { with: /\A[0-9]+\z/ }
  end
  
end



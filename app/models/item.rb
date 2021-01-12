class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day_to_ship
  has_one_attached :image
  belongs_to :user

  with_options presence: true do
   validates :title, :text, :image, presence: true
   validates :category_id, :condition_id, :shipping_id, :prefecture_id, :day_to_ship_id, numericality: {other_than: 1, message: "can't be blank"}
   validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 99999999, message: "is invalid"}
   validates :price, format: { with: /\A[0-9]+\z/ }
  end
  
end


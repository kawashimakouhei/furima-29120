class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

validates :nickname, :first_name, :last_name, :first_name_reading, :last_name_reading, presence: true
validates :birthdate, presence: true
validates :first_name, :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥]/ }       
validates :first_name_reading, :last_name_reading, format: { with: /\A[ァ-ヶー－]+\z/ }
validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/ }

has_many :items
has_one :order
has_one :address

end
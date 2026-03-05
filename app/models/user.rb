class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, 
         :confirmable

  has_many :rentals, dependent: :destroy
  has_many :vehicles, through: :rentals
end
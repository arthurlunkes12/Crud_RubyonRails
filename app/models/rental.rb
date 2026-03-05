class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :start_date, :end_date, presence: true
  validate :user_cannot_have_two_active_rentals
end
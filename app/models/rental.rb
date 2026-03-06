class Rental < ApplicationRecord
  belongs_to :user
  belongs_to :vehicle

  validates :start_date, presence: true
  validates :end_date, presence: true, on: :update
  validate :user_cannot_have_two_active_rentals

  private

  def user_cannot_have_two_active_rentals
  active_rental = Rental.where(user: user)
                        .where(end_date: nil)
                        .where.not(id: id)
                        .exists?

    if active_rental
      errors.add(:base, "Você já possui um veículo alugado")
    end
  end
end
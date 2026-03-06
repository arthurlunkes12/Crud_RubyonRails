class Vehicle < ApplicationRecord

  has_many :rentals, dependent: :destroy

  validates :brand, :model, :plate, :year, presence: true

  scope :available, -> { where(status: "available") }
  scope :rented, -> { where(status: "rented") }

  def self.ransackable_attributes(auth_object = nil)
    ["brand", "model", "year", "plate", "created_at", "updated_at", "id"]
  end

end
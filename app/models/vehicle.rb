class Vehicle < ApplicationRecord

  belongs_to :user
    validates :brand, :model, :plate, :year, presence: true
    def self.ransackable_attributes(auth_object = nil)
    ["brand", "model", "year", "plate", "created_at", "updated_at", "id"]

    

  end
end

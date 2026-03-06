class AddDurationToRentals < ActiveRecord::Migration[8.1]
  def change
    add_column :rentals, :duration, :integer
  end
end

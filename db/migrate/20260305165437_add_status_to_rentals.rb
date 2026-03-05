class AddStatusToRentals < ActiveRecord::Migration[8.1]
  def change
    add_column :rentals, :status, :string
  end
end

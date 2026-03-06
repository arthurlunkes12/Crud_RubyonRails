class RemoveUserFromVehicles < ActiveRecord::Migration[8.1]
  def change
    remove_reference :vehicles, :user, null: false, foreign_key: true
  end
end

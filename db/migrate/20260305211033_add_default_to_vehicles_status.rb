class AddDefaultToVehiclesStatus < ActiveRecord::Migration[8.1]
  def change
    change_column :vehicles, :status, :string, default: "available"
  end
end

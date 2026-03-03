class CreateVehicles < ActiveRecord::Migration[8.1]
  def change
    create_table :vehicles do |t|
      t.string :brand
      t.integer :year
      t.string :model
      t.string :plate

      t.timestamps
    end
  end
end

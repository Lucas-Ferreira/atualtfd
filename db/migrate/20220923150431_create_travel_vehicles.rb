class CreateTravelVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :travel_vehicles do |t|
      t.references :travel, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

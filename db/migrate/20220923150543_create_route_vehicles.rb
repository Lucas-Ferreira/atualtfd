class CreateRouteVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :route_vehicles do |t|
      t.references :route, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end

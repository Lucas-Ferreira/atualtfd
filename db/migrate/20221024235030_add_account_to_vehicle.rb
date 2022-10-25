class AddAccountToVehicle < ActiveRecord::Migration[7.0]
  def change
    add_column :vehicles, :account_id, :integer
  end
end

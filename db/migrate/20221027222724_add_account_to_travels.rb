class AddAccountToTravels < ActiveRecord::Migration[7.0]
  def change
    add_column :travels, :account_id, :integer
  end
end

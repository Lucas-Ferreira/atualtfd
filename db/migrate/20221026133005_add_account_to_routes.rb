class AddAccountToRoutes < ActiveRecord::Migration[7.0]
  def change
    add_column :routes, :account_id, :integer
  end
end

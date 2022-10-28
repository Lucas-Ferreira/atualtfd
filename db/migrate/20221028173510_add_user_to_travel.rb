class AddUserToTravel < ActiveRecord::Migration[7.0]
  def change
    add_column :travels, :user_id, :integer
  end
end

class AddPresence2ToConfirmation < ActiveRecord::Migration[7.0]
  def change
    add_column :confirmations, :present_two, :boolean
  end
end

class AddMonthToTravel < ActiveRecord::Migration[7.0]
  def change
    add_column :travels, :month, :integer
  end
end

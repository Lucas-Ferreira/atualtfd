class AddStatusToEmpenhos < ActiveRecord::Migration[7.0]
  def change
    add_column :empenhos, :status, :string
  end
end

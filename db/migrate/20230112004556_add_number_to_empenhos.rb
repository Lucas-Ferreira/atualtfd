class AddNumberToEmpenhos < ActiveRecord::Migration[7.0]
  def change
    add_column :empenhos, :number, :string
  end
end

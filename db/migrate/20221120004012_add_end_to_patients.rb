class AddEndToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :endereco, :string
  end
end

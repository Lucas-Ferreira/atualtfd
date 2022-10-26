class AddRetornoToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :retorno, :boolean
  end
end

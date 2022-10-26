class AddPartidaToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :partida, :boolean
  end
end

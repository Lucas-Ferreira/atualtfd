class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :name
      t.string :cel
      t.string :cpf
      t.string :acompanhante
      t.string :destino

      t.timestamps
    end
  end
end

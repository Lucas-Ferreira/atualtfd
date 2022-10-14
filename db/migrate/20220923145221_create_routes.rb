class CreateRoutes < ActiveRecord::Migration[7.0]
  def change
    create_table :routes do |t|
      t.string :origem
      t.string :destino
      t.string :especialidade
      t.string :capacidade

      t.timestamps
    end
  end
end

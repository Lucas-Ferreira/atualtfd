class CreateTravels < ActiveRecord::Migration[7.0]
  def change
    create_table :travels do |t|
      t.string :status
      t.string :hr_partida
      t.string :hr_volta
      t.string :hr_final
      t.references :route, null: false, foreign_key: true

      t.timestamps
    end
  end
end

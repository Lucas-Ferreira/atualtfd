class CreateSaldos < ActiveRecord::Migration[7.0]
  def change
    create_table :saldos do |t|
      t.float :saldo_total
      t.float :aporte_total
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

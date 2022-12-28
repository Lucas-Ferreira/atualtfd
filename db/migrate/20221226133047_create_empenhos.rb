class CreateEmpenhos < ActiveRecord::Migration[7.0]
  def change
    create_table :empenhos do |t|
      t.float :valor
      t.string :date
      t.string :motorista
      t.references :user, null: false, foreign_key: true
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end

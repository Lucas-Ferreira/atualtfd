class CreateComprovantes < ActiveRecord::Migration[7.0]
  def change
    create_table :comprovantes do |t|
      t.string :type
      t.float :valor
      t.references :user, null: false, foreign_key: true
      t.references :travel, null: false, foreign_key: true

      t.timestamps
    end
  end
end

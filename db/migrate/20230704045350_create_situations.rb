class CreateSituations < ActiveRecord::Migration[6.1]
  def change
    create_table :situations do |t|
      t.references :actor,  null: false, foreign_key: true
      t.string :name,       null: false

      t.timestamps
    end
  end
end

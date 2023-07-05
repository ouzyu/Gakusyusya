class CreateActors < ActiveRecord::Migration[6.1]
  def change
    create_table :actors do |t|
      t.references :map, foreign_key: true
      t.string :name,   null: false
      t.integer :role,  null: false, default: 0
      t.timestamps
    end
  end
end

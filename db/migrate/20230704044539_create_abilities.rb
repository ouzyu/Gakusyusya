class CreateAbilities < ActiveRecord::Migration[6.1]
  def change
    create_table :abilities do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name,     null: false
      t.integer :level,   null: false, default: 1

      t.timestamps
    end
  end
end

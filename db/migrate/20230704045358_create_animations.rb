class CreateAnimations < ActiveRecord::Migration[6.1]
  def change
    create_table :animations do |t|
      t.references :situation, null: false, foreign_key: true

      t.timestamps
    end
  end
end

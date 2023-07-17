class CreateQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :quests do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :ability,  null: false, foreign_key: true
      t.references :actor,    null: false, foreign_key: true
      t.references :map,      null: false, foreign_key: true
      t.text :content,        null: false
      t.integer :set_seconds, null: false
      t.integer :study_time,  default: 0
      t.boolean :is_finished, default: false
      t.datetime :start_time, null: false
      t.datetime :pause_time,  null: true

      t.timestamps
    end
  end
end

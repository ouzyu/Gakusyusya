class CreateQuests < ActiveRecord::Migration[6.1]
  def change
    create_table :quests do |t|
      t.references :user,     null: false, foreign_key: true
      t.references :ability,  null: false, foreign_key: true
      t.references :actor,    null: false, foreign_key: true
      t.references :map,      null: false, foreign_key: true
      t.text :content,        null: false
      t.integer :seconds,     null: false
      t.boolean :is_finished, default: false
      t.datetime :start_time, null: false
      t.datetime :pose_time,  null: true

      t.timestamps
    end
  end
end

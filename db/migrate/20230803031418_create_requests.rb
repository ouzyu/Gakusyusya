class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.integer :genre,     null: false, default: 0
      t.string  :email,     null: false
      t.text    :content,   null: false
      t.integer :status,    null: false, default: 0

      t.timestamps
    end
  end
end

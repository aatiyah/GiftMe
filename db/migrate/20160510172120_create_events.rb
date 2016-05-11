class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.date :date
      t.boolean :annual, default: false
      t.text :notes
      t.integer :user_id

      t.timestamps null: false
    end
  end
end

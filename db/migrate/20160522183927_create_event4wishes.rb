class CreateEvent4wishes < ActiveRecord::Migration
  def change
    create_table :event4wishes do |t|
      t.integer :event_id
      t.integer :wish_id

      t.timestamps null: false
    end
  end
end

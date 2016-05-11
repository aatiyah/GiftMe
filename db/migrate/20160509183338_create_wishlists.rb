class CreateWishlists < ActiveRecord::Migration
  def change
    create_table :wishlists do |t|
      t.string :title
      t.integer :price
      t.text :info

      t.timestamps null: false
    end
  end
end

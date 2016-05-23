class RetypePriceToDecimal < ActiveRecord::Migration
  def change
	change_column :wishlists, :price, :decimal, :precision => 10, :scale => 2
  end
end

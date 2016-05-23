class RetypePriceToDecimal < ActiveRecord::Migration
  def change
	def up
	    change_column :wishlists, :price, :integer
	end
	def down
	    # This might cause trouble if you have strings longer
	    # than 255 characters.
	    change_column :wishlist, :price, :decimal, :precision => 10, :scale => 2
	end
  end
end

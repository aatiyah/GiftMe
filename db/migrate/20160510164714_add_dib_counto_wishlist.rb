class AddDibCountoWishlist < ActiveRecord::Migration
  def change
  	add_column :wishlist, :dibcheck, :boolean
  end
end

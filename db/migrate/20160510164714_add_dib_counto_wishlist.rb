class AddDibCountoWishlist < ActiveRecord::Migration
  def change
  	add_column :wishlists, :dibcheck, :boolean, default: false
  end
end

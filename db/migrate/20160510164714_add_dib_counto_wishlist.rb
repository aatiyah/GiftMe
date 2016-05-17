class AddDibCountoWishlist < ActiveRecord::Migration
  def change
  	add_column :wishlists, :dibcheck, :boolean, defaulf: false
  end
end

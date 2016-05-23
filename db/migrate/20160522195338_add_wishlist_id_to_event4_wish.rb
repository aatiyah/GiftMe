class AddWishlistIdToEvent4Wish < ActiveRecord::Migration
  def change
    add_column :event4wishes, :wishlist_id, :integer
  end
end

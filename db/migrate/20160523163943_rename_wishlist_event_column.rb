class RenameWishlistEventColumn < ActiveRecord::Migration
  def change
  	rename_column :wishlists, :select_event, :event_id
  end
end

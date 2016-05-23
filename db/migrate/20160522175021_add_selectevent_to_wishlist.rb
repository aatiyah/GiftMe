class AddSelecteventToWishlist < ActiveRecord::Migration
  def change
    add_column :wishlists, :select_event, :integer
  end
end

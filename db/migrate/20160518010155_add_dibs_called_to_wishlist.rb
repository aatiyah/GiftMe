class AddDibsCalledToWishlist < ActiveRecord::Migration
  def change
    add_column :wishlists, :dibs_user, :integer
  end
end

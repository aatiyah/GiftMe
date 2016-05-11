json.array!(@wishlists) do |wishlist|
  json.extract! wishlist, :id, :title, :price, :info
  json.url wishlist_url(wishlist, format: :json)
end

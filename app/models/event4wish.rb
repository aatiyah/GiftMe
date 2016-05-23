class Event4wish < ActiveRecord::Base
	belongs_to :event
	belongs_to :wishlist
end

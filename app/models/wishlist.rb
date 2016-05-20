class Wishlist < ActiveRecord::Base
	include PublicActivity::Model
	tracked except: [:destroy], owner: Proc.new{ |controller, model| controller.current_user }

	validates :title, presence: true
	belongs_to :user
	has_many :product
end

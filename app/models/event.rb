class Event < ActiveRecord::Base
	include PublicActivity::Model
	tracked owner: Proc.new{ |controller, model| controller.current_user }

	validates :title, :date, presence: true
	belongs_to :user
end

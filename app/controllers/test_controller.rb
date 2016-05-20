class TestController < ApplicationController
	before_action :load_activities, only: [:index, :show, :new, :edit]

	def welcome
	end

	def profile
		@user = User.find(params[:id])
		@activities = PublicActivity::Activity.order("created_at desc").where(:owner_id => params[:id]) 
	end

	def load_activities
	end

	def home
		@activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user.friends.pluck(:id).push(current_user.id))
	end
end

class TestController < ApplicationController
	before_action :load_activities, only: [:index, :show, :new, :edit]

	def welcome
	end

	def profile
	    @activities = PublicActivity::Activity.order("created_at desc").where(owner_id: current_user, owner_type: "User")
	end

	def load_activities
	end

	def home
		
	end
end

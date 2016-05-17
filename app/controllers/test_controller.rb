class TestController < ApplicationController
	before_action :load_activities, only: [:index, :show, :new, :edit]

	def welcome
	end

	def profile
	end

	def load_activities
		@activities = PublicActivity::Activity.order("created_at desc").all
	end

end

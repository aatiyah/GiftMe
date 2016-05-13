class FriendshipsController < ApplicationController
	def index
		@users = User.all
	end

	def show
	end

	def create
		friend = User.find(params[:friend_id])
		Friendship.request(current_user,friend)
		flash[:notice] = "Friend #{friend.email} requested."
		redirect_to :back
	end

	def update
		friend = User.find(params[:friend_id])
		Friendship.accept(current_user,friend)
		flash[:notice] = "Friend request accepted, you are now friend with #{friend.email}."
		redirect_to :back
	end

	def destroy
		friend = User.find(params[:friend_id])
		Friendship.breakup(current_user,friend)
		flash[:notice] = "Friend #{friend.email} Removed"
		redirect_to :back
	end
end

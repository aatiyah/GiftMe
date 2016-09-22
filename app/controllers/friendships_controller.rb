class FriendshipsController < ApplicationController
	def index
		@users = User.all.order("creatd_at DESC")
	end

	def show
		@user = User.find(params[:id])
	end

	def create
		friend = User.find(params[:friend_id])
		Friendship.request(current_user,friend)
		flash[:notice] = "Friend request is sent to #{friend.full_name}."
		redirect_to :back
	end

	def update
		friend = User.find(params[:friend_id])
		Friendship.accept(current_user,friend)
		flash[:notice] = "Friend request accepted, you are now friends with #{friend.full_name}."
		redirect_to :back
	end

	def destroy
		friend = User.find(params[:friend_id])
		Friendship.breakup(current_user,friend)
		flash[:notice] = "Friend #{friend.full_name} Removed"
		redirect_to :back
	end
end

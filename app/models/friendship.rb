class Friendship < ActiveRecord::Base
	belongs_to :user
	belongs_to :friend, class_name:"User", foreign_key: "friend_id"

	validates :user_id, :friend_id, :status, presence: true
	validates :user_id, uniqueness: {scope: :friend_id, message:"should have only one relationship between two friend"}

	# Return true if the users are (possibly pending/requested) friends.
	def self.exist?(user, friend)
		not find_by_user_id_and_friend_id(user,friend).nil?
	end

	# Send a friend request
	def self.request(user, friend)
		unless user == friend or Friendship.exist?(user,friend) == true
			transaction do
				create(user_id: user.id, friend_id: friend.id, status: "pending")
				create(user_id: friend.id, friend_id: user.id, status: "requested")
			end
		end
	end

	# Accept a friend request
	def self.accept(user,friend)
		transaction do
			accepted_at = Time.now
			accept_one_side(user, friend, accepted_at)
			accept_one_side(friend, user, accepted_at)
		end
	end

	# Decline a friend request
	def self.breakup(user, friend)
		transaction do
			destroy(find_by_user_id_and_friend_id(user,friend))
			destroy(find_by_user_id_and_friend_id(friend,user))
		end
	end

	private

	def self.accept_one_side(user, friend, accepted_at)
		request = find_by_user_id_and_friend_id(user,friend)
		request.update(status:"accepted", accepted_at:accepted_at)
		request.save!
	end
end

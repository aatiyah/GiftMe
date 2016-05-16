class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
<<<<<<< HEAD
  has_many :events  
  has_many :friendships
  has_many :passive_friendships, :class_name => "Friendship", :foreign_key => "friend_id"

  has_many :active_friends, -> { where(friendships: { approved: true}) }, :through => :friendships, :source => :friend
  has_many :passive_friends, -> { where(friendships: { approved: true}) }, :through => :passive_friendships, :source => :user
  has_many :pending_friends, -> { where(friendships: { approved: false}) }, :through => :friendships, :source => :friend
  has_many :requested_friendships, -> { where(friendships: { approved: false}) }, :through => :passive_friendships, :source => :user


  def friends
    active_friends | passive_friends
  end       
=======
	has_many :events

	# Friendship related
	has_many :friendships
	
	has_many :friends, 
		-> { where friendships: { status: "accepted"} },
		through: :friendships

	has_many :requested_friends,
		-> { where friendships: { status: "requested"} },
		through: :friendships, 
		source: :friend 

	has_many :pending_friends,
		-> { where friendships: { status: "pending"} },
		through: :friendships, 
		source: :friend       
>>>>>>> mutual_friendship
end
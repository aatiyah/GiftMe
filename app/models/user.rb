class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

    validates :username, :birthday,:first_name, :last_name, presence: true

    
    
    has_many :wishlists
	has_many :events
	has_many :statuses

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

	def full_name
    	name = first_name + ' ' + last_name
 	end
end


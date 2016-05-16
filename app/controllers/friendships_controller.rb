class FriendshipsController < ApplicationController
<<<<<<< HEAD


  # GET /friendships
  # GET /friendships.json
  def index
    @users = User.all
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id], approved: "false")
      if @friendship.save
        flash[:notice] = "Friend requested."
        redirect_to :back
      else
        flash[:error] = "Unable to request friendship."
        redirect_to :back
      end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    @friendship = Friendship.where(friend_id: current_user, user_id: params[:id] ).first
    @friendship.update(approved: true)
      if @friendship.save
        redirect_to friends_path, :notice => "Successfully confirmed friend!"
      else
        redirect_to friends_path, :notice => "Sorry! Could not confirm friend!"
      end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json
  def destroy
     @friendship = Friendship.where(friend_id: [current_user, params[:id]]).where(user_id: [current_user, params[:id]]).last
      @friendship.destroy
      flash[:notice] = "Removed friendship."
      redirect_to :back
  end

=======
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
>>>>>>> mutual_friendship
end

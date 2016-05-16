require 'test_helper'

class FriendshipsControllerTest < ActionController::TestCase
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ad0b1dc82b648935902ce1e32374d15c7c0d4a2c
  setup do
    @friendship = friendships(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friendships)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friendship" do
    assert_difference('Friendship.count') do
<<<<<<< HEAD
      post :create, friendship: { approved: @friendship.approved, friend_id: @friendship.friend_id, user_id: @friendship.user_id }
=======
      post :create, friendship: { create: @friendship.create, destroy: @friendship.destroy, friend_id: @friendship.friend_id, user_id: @friendship.user_id }
>>>>>>> ad0b1dc82b648935902ce1e32374d15c7c0d4a2c
    end

    assert_redirected_to friendship_path(assigns(:friendship))
  end

  test "should show friendship" do
    get :show, id: @friendship
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friendship
    assert_response :success
  end

  test "should update friendship" do
<<<<<<< HEAD
    patch :update, id: @friendship, friendship: { approved: @friendship.approved, friend_id: @friendship.friend_id, user_id: @friendship.user_id }
=======
    patch :update, id: @friendship, friendship: { create: @friendship.create, destroy: @friendship.destroy, friend_id: @friendship.friend_id, user_id: @friendship.user_id }
>>>>>>> ad0b1dc82b648935902ce1e32374d15c7c0d4a2c
    assert_redirected_to friendship_path(assigns(:friendship))
  end

  test "should destroy friendship" do
    assert_difference('Friendship.count', -1) do
      delete :destroy, id: @friendship
    end

    assert_redirected_to friendships_path
  end
<<<<<<< HEAD
=======
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

>>>>>>> mutual_friendship
=======
>>>>>>> ad0b1dc82b648935902ce1e32374d15c7c0d4a2c
end

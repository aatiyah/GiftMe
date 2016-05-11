require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get friend" do
    get :friend
    assert_response :success
  end

end

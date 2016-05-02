require 'test_helper'

class TestControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get profile" do
    get :profile
    assert_response :success
  end

end

require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get group" do
    get :group
    assert_response :success
  end

end

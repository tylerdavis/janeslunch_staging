require 'test_helper'

class InfoControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get terms" do
    get :terms
    assert_response :success
  end

  test "should get security" do
    get :security
    assert_response :success
  end

  test "should get suggestions" do
    get :suggestions
    assert_response :success
  end

end

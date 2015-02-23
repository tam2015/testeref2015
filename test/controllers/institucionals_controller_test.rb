require 'test_helper'

class InstitucionalsControllerTest < ActionController::TestCase
  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get terms" do
    get :terms
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end

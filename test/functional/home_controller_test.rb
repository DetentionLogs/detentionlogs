require 'test_helper'

class HomeControllerTest < ActionController::TestCase

  test "should get front page" do
    get :front_page
    assert_response :success
  end

  test "should be root" do
    get :root
    assert_response :success
  end
end

require "test_helper"

class Admin::AnimationsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get admin_animations_edit_url
    assert_response :success
  end
end

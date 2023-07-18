require "test_helper"

class Admin::SituationsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get admin_situations_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_situations_edit_url
    assert_response :success
  end
end

require "test_helper"

class Admin::ActorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_actors_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_actors_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_actors_edit_url
    assert_response :success
  end
end

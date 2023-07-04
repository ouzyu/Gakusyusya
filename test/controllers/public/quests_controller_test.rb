require "test_helper"

class Public::QuestsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get public_quests_new_url
    assert_response :success
  end

  test "should get index" do
    get public_quests_index_url
    assert_response :success
  end

  test "should get show" do
    get public_quests_show_url
    assert_response :success
  end
end

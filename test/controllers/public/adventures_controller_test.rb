require "test_helper"

class Public::AdventuresControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get public_adventures_start_url
    assert_response :success
  end

  test "should get boss" do
    get public_adventures_boss_url
    assert_response :success
  end
end

require "test_helper"

class Public::AbilitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_abilities_index_url
    assert_response :success
  end

  test "should get edit" do
    get public_abilities_edit_url
    assert_response :success
  end
end

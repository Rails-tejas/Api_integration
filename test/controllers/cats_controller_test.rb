require "test_helper"

class CatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cats_index_url
    assert_response :success
  end

  test "should get search" do
    get cats_search_url
    assert_response :success
  end
end

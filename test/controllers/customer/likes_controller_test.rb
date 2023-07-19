require "test_helper"

class Customer::LikesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_likes_index_url
    assert_response :success
  end
end

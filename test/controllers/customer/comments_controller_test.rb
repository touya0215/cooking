require "test_helper"

class Customer::CommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customer_comments_show_url
    assert_response :success
  end
end

require 'test_helper'

class GoodControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get good_search_url
    assert_response :success
  end

end

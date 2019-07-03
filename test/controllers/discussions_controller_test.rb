require 'test_helper'

class DiscussionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get discussions_show_url
    assert_response :success
  end

end

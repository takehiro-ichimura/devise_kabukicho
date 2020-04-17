require 'test_helper'

class DmsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get dms_show_url
    assert_response :success
  end

end

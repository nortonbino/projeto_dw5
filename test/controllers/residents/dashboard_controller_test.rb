require 'test_helper'

class Residents::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get residents_dashboard_index_url
    assert_response :success
  end

end

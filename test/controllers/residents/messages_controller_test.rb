require 'test_helper'

class Residents::MessagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get residents_messages_index_url
    assert_response :success
  end

end

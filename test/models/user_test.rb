require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
		@user = User.new
	end

  test "fields should not be blank" do
    @user.email = ""
    @user.password = ""

    @user.should_not be_valid
  end

end

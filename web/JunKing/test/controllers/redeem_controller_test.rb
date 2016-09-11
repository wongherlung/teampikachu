require 'test_helper'

class RedeemControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end

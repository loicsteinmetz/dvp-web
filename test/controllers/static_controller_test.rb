require 'test_helper'

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get static_home_url
    assert_response :success
  end

  test "should get portfolio" do
    get static_portfolio_url
    assert_response :success
  end

end

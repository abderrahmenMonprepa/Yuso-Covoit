require 'test_helper'

class ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get reservation_new_url
    assert_response :success
  end

  test "should get show" do
    get reservation_show_url
    assert_response :success
  end

  test "should get ndex" do
    get reservation_ndex_url
    assert_response :success
  end

end

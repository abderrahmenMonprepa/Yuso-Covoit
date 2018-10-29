require 'test_helper'

class RoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @route = routes(:one)
  end

  test "should get index" do
    get routes_url
    assert_response :success
  end

  test "should get new" do
    get new_route_url
    assert_response :success
  end

  test "should create route" do
    assert_difference('Route.count') do
      post routes_url, params: { route: { animal_permission: @route.animal_permission, arrival_point_string: @route.arrival_point_string, departure_point: @route.departure_point, departure_time: @route.departure_time, estimated_arrival_time: @route.estimated_arrival_time, luggage: @route.luggage, place_number: @route.place_number, price: @route.price, smoker_permission: @route.smoker_permission, user_id: @route.user_id } }
    end

    assert_redirected_to route_url(Route.last)
  end

  test "should show route" do
    get route_url(@route)
    assert_response :success
  end

  test "should get edit" do
    get edit_route_url(@route)
    assert_response :success
  end

  test "should update route" do
    patch route_url(@route), params: { route: { animal_permission: @route.animal_permission, arrival_point_string: @route.arrival_point_string, departure_point: @route.departure_point, departure_time: @route.departure_time, estimated_arrival_time: @route.estimated_arrival_time, luggage: @route.luggage, place_number: @route.place_number, price: @route.price, smoker_permission: @route.smoker_permission, user_id: @route.user_id } }
    assert_redirected_to route_url(@route)
  end

  test "should destroy route" do
    assert_difference('Route.count', -1) do
      delete route_url(@route)
    end

    assert_redirected_to routes_url
  end
end

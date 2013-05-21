require 'test_helper'

class LocationGroupsControllerTest < ActionController::TestCase
  setup do
    @location_group = location_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:location_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create location_group" do
    assert_difference('LocationGroup.count') do
      post :create, location_group: { name: @location_group.name }
    end

    assert_redirected_to location_group_path(assigns(:location_group))
  end

  test "should show location_group" do
    get :show, id: @location_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @location_group
    assert_response :success
  end

  test "should update location_group" do
    put :update, id: @location_group, location_group: { name: @location_group.name }
    assert_redirected_to location_group_path(assigns(:location_group))
  end

  test "should destroy location_group" do
    assert_difference('LocationGroup.count', -1) do
      delete :destroy, id: @location_group
    end

    assert_redirected_to location_groups_path
  end
end

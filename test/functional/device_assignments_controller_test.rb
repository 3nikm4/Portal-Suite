require 'test_helper'

class DeviceAssignmentsControllerTest < ActionController::TestCase
  setup do
    @device_assignment = device_assignments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:device_assignments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device_assignment" do
    assert_difference('DeviceAssignment.count') do
      post :create, device_assignment: @device_assignment.attributes
    end

    assert_redirected_to device_assignment_path(assigns(:device_assignment))
  end

  test "should show device_assignment" do
    get :show, id: @device_assignment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device_assignment
    assert_response :success
  end

  test "should update device_assignment" do
    put :update, id: @device_assignment, device_assignment: @device_assignment.attributes
    assert_redirected_to device_assignment_path(assigns(:device_assignment))
  end

  test "should destroy device_assignment" do
    assert_difference('DeviceAssignment.count', -1) do
      delete :destroy, id: @device_assignment
    end

    assert_redirected_to device_assignments_path
  end
end

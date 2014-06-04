require 'test_helper'

class DevicesControllerTest < ActionController::TestCase
  setup do
    @device = devices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:devices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create device" do
    assert_difference('Device.count') do
      post :create, device: { devise_type: @device.devise_type, free_disk_space: @device.free_disk_space, hardware_platform: @device.hardware_platform, imei: @device.imei, name: @device.name, os: @device.os, platform_string: @device.platform_string, serial_number: @device.serial_number, total_disk: @device.total_disk, total_memory: @device.total_memory, user_id: @device.user_id }
    end

    assert_redirected_to device_path(assigns(:device))
  end

  test "should show device" do
    get :show, id: @device
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @device
    assert_response :success
  end

  test "should update device" do
    patch :update, id: @device, device: { devise_type: @device.devise_type, free_disk_space: @device.free_disk_space, hardware_platform: @device.hardware_platform, imei: @device.imei, name: @device.name, os: @device.os, platform_string: @device.platform_string, serial_number: @device.serial_number, total_disk: @device.total_disk, total_memory: @device.total_memory, user_id: @device.user_id }
    assert_redirected_to device_path(assigns(:device))
  end

  test "should destroy device" do
    assert_difference('Device.count', -1) do
      delete :destroy, id: @device
    end

    assert_redirected_to devices_path
  end
end

require 'test_helper'

class FarmersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @farmer = farmers(:one)
  end

  test "should get index" do
    get farmers_url
    assert_response :success
  end

  test "should get new" do
    get new_farmer_url
    assert_response :success
  end

  test "should create farmer" do
    assert_difference('Farmer.count') do
      post farmers_url, params: { farmer: { farm_name: @farmer.farm_name, users_id: @farmer.users_id } }
    end

    assert_redirected_to farmer_url(Farmer.last)
  end

  test "should show farmer" do
    get farmer_url(@farmer)
    assert_response :success
  end

  test "should get edit" do
    get edit_farmer_url(@farmer)
    assert_response :success
  end

  test "should update farmer" do
    patch farmer_url(@farmer), params: { farmer: { farm_name: @farmer.farm_name, users_id: @farmer.users_id } }
    assert_redirected_to farmer_url(@farmer)
  end

  test "should destroy farmer" do
    assert_difference('Farmer.count', -1) do
      delete farmer_url(@farmer)
    end

    assert_redirected_to farmers_url
  end
end

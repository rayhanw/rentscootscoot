require 'test_helper'

class ScootersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get scooters_index_url
    assert_response :success
  end

  test "should get show" do
    get scooters_show_url
    assert_response :success
  end

  test "should get new" do
    get scooters_new_url
    assert_response :success
  end

  test "should get create" do
    get scooters_create_url
    assert_response :success
  end

end

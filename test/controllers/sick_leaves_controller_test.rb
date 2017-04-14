require 'test_helper'

class SickLeavesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sick_leafe = sick_leaves(:one)
  end

  test "should get index" do
    get sick_leaves_url
    assert_response :success
  end

  test "should get new" do
    get new_sick_leafe_url
    assert_response :success
  end

  test "should create sick_leafe" do
    assert_difference('SickLeave.count') do
      post sick_leaves_url, params: { sick_leafe: {  } }
    end

    assert_redirected_to sick_leafe_url(SickLeave.last)
  end

  test "should show sick_leafe" do
    get sick_leafe_url(@sick_leafe)
    assert_response :success
  end

  test "should get edit" do
    get edit_sick_leafe_url(@sick_leafe)
    assert_response :success
  end

  test "should update sick_leafe" do
    patch sick_leafe_url(@sick_leafe), params: { sick_leafe: {  } }
    assert_redirected_to sick_leafe_url(@sick_leafe)
  end

  test "should destroy sick_leafe" do
    assert_difference('SickLeave.count', -1) do
      delete sick_leafe_url(@sick_leafe)
    end

    assert_redirected_to sick_leaves_url
  end
end

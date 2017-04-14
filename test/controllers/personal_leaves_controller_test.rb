require 'test_helper'

class PersonalLeavesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @personal_leafe = personal_leaves(:one)
  end

  test "should get index" do
    get personal_leaves_url
    assert_response :success
  end

  test "should get new" do
    get new_personal_leafe_url
    assert_response :success
  end

  test "should create personal_leafe" do
    assert_difference('PersonalLeave.count') do
      post personal_leaves_url, params: { personal_leafe: {  } }
    end

    assert_redirected_to personal_leafe_url(PersonalLeave.last)
  end

  test "should show personal_leafe" do
    get personal_leafe_url(@personal_leafe)
    assert_response :success
  end

  test "should get edit" do
    get edit_personal_leafe_url(@personal_leafe)
    assert_response :success
  end

  test "should update personal_leafe" do
    patch personal_leafe_url(@personal_leafe), params: { personal_leafe: {  } }
    assert_redirected_to personal_leafe_url(@personal_leafe)
  end

  test "should destroy personal_leafe" do
    assert_difference('PersonalLeave.count', -1) do
      delete personal_leafe_url(@personal_leafe)
    end

    assert_redirected_to personal_leaves_url
  end
end

require 'test_helper'

class BelongTosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @belong_to = belong_tos(:one)
  end

  test "should get index" do
    get belong_tos_url
    assert_response :success
  end

  test "should get new" do
    get new_belong_to_url
    assert_response :success
  end

  test "should create belong_to" do
    assert_difference('BelongTo.count') do
      post belong_tos_url, params: { belong_to: {  } }
    end

    assert_redirected_to belong_to_url(BelongTo.last)
  end

  test "should show belong_to" do
    get belong_to_url(@belong_to)
    assert_response :success
  end

  test "should get edit" do
    get edit_belong_to_url(@belong_to)
    assert_response :success
  end

  test "should update belong_to" do
    patch belong_to_url(@belong_to), params: { belong_to: {  } }
    assert_redirected_to belong_to_url(@belong_to)
  end

  test "should destroy belong_to" do
    assert_difference('BelongTo.count', -1) do
      delete belong_to_url(@belong_to)
    end

    assert_redirected_to belong_tos_url
  end
end

require 'test_helper'

class RequiresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @require = requires(:one)
  end

  test "should get index" do
    get requires_url
    assert_response :success
  end

  test "should get new" do
    get new_require_url
    assert_response :success
  end

  test "should create require" do
    assert_difference('Require.count') do
      post requires_url, params: { require: {  } }
    end

    assert_redirected_to require_url(Require.last)
  end

  test "should show require" do
    get require_url(@require)
    assert_response :success
  end

  test "should get edit" do
    get edit_require_url(@require)
    assert_response :success
  end

  test "should update require" do
    patch require_url(@require), params: { require: {  } }
    assert_redirected_to require_url(@require)
  end

  test "should destroy require" do
    assert_difference('Require.count', -1) do
      delete require_url(@require)
    end

    assert_redirected_to requires_url
  end
end

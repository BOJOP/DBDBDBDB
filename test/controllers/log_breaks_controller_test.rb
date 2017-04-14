require 'test_helper'

class LogBreaksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @log_break = log_breaks(:one)
  end

  test "should get index" do
    get log_breaks_url
    assert_response :success
  end

  test "should get new" do
    get new_log_break_url
    assert_response :success
  end

  test "should create log_break" do
    assert_difference('LogBreak.count') do
      post log_breaks_url, params: { log_break: {  } }
    end

    assert_redirected_to log_break_url(LogBreak.last)
  end

  test "should show log_break" do
    get log_break_url(@log_break)
    assert_response :success
  end

  test "should get edit" do
    get edit_log_break_url(@log_break)
    assert_response :success
  end

  test "should update log_break" do
    patch log_break_url(@log_break), params: { log_break: {  } }
    assert_redirected_to log_break_url(@log_break)
  end

  test "should destroy log_break" do
    assert_difference('LogBreak.count', -1) do
      delete log_break_url(@log_break)
    end

    assert_redirected_to log_breaks_url
  end
end

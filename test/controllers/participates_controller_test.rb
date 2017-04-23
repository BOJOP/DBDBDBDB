require 'test_helper'

class ParticipatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @participate = participates(:one)
  end

  test "should get index" do
    get participates_url
    assert_response :success
  end

  test "should get new" do
    get new_participate_url
    assert_response :success
  end

  test "should create participate" do
    assert_difference('Participate.count') do
      post participates_url, params: { participate: {  } }
    end

    assert_redirected_to participate_url(Participate.last)
  end

  test "should show participate" do
    get participate_url(@participate)
    assert_response :success
  end

  test "should get edit" do
    get edit_participate_url(@participate)
    assert_response :success
  end

  test "should update participate" do
    patch participate_url(@participate), params: { participate: {  } }
    assert_redirected_to participate_url(@participate)
  end

  test "should destroy participate" do
    assert_difference('Participate.count', -1) do
      delete participate_url(@participate)
    end

    assert_redirected_to participates_url
  end
end

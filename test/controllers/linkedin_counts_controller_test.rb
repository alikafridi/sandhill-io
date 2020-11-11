require 'test_helper'

class LinkedinCountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @linkedin_count = linkedin_counts(:one)
  end

  test "should get index" do
    get linkedin_counts_url
    assert_response :success
  end

  test "should get new" do
    get new_linkedin_count_url
    assert_response :success
  end

  test "should create linkedin_count" do
    assert_difference('LinkedinCount.count') do
      post linkedin_counts_url, params: { linkedin_count: {  } }
    end

    assert_redirected_to linkedin_count_url(LinkedinCount.last)
  end

  test "should show linkedin_count" do
    get linkedin_count_url(@linkedin_count)
    assert_response :success
  end

  test "should get edit" do
    get edit_linkedin_count_url(@linkedin_count)
    assert_response :success
  end

  test "should update linkedin_count" do
    patch linkedin_count_url(@linkedin_count), params: { linkedin_count: {  } }
    assert_redirected_to linkedin_count_url(@linkedin_count)
  end

  test "should destroy linkedin_count" do
    assert_difference('LinkedinCount.count', -1) do
      delete linkedin_count_url(@linkedin_count)
    end

    assert_redirected_to linkedin_counts_url
  end
end

require 'test_helper'

class MobileAppsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mobile_app = mobile_apps(:one)
  end

  test "should get index" do
    get mobile_apps_url
    assert_response :success
  end

  test "should get new" do
    get new_mobile_app_url
    assert_response :success
  end

  test "should create mobile_app" do
    assert_difference('MobileApp.count') do
      post mobile_apps_url, params: { mobile_app: { android: @mobile_app.android, android_link: @mobile_app.android_link, company_id: @mobile_app.company_id, ios_link: @mobile_app.ios_link, ios_sensortower: @mobile_app.ios_sensortower, name: @mobile_app.name, slug: @mobile_app.slug } }
    end

    assert_redirected_to mobile_app_url(MobileApp.last)
  end

  test "should show mobile_app" do
    get mobile_app_url(@mobile_app)
    assert_response :success
  end

  test "should get edit" do
    get edit_mobile_app_url(@mobile_app)
    assert_response :success
  end

  test "should update mobile_app" do
    patch mobile_app_url(@mobile_app), params: { mobile_app: { android: @mobile_app.android, android_link: @mobile_app.android_link, company_id: @mobile_app.company_id, ios_link: @mobile_app.ios_link, ios_sensortower: @mobile_app.ios_sensortower, name: @mobile_app.name, slug: @mobile_app.slug } }
    assert_redirected_to mobile_app_url(@mobile_app)
  end

  test "should destroy mobile_app" do
    assert_difference('MobileApp.count', -1) do
      delete mobile_app_url(@mobile_app)
    end

    assert_redirected_to mobile_apps_url
  end
end

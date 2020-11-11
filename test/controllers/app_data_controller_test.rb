require 'test_helper'

class AppDataControllerTest < ActionDispatch::IntegrationTest
  setup do
    @app_datum = app_data(:one)
  end

  test "should get index" do
    get app_data_url
    assert_response :success
  end

  test "should get new" do
    get new_app_datum_url
    assert_response :success
  end

  test "should create app_datum" do
    assert_difference('AppDatum.count') do
      post app_data_url, params: { app_datum: { app_id: @app_datum.app_id, app_type: @app_datum.app_type, date_collected: @app_datum.date_collected, monthly_downloads: @app_datum.monthly_downloads, monthly_revenue: @app_datum.monthly_revenue } }
    end

    assert_redirected_to app_datum_url(AppDatum.last)
  end

  test "should show app_datum" do
    get app_datum_url(@app_datum)
    assert_response :success
  end

  test "should get edit" do
    get edit_app_datum_url(@app_datum)
    assert_response :success
  end

  test "should update app_datum" do
    patch app_datum_url(@app_datum), params: { app_datum: { app_id: @app_datum.app_id, app_type: @app_datum.app_type, date_collected: @app_datum.date_collected, monthly_downloads: @app_datum.monthly_downloads, monthly_revenue: @app_datum.monthly_revenue } }
    assert_redirected_to app_datum_url(@app_datum)
  end

  test "should destroy app_datum" do
    assert_difference('AppDatum.count', -1) do
      delete app_datum_url(@app_datum)
    end

    assert_redirected_to app_data_url
  end
end

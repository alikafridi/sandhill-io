require 'test_helper'

class DaycaresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @daycare = daycares(:one)
  end

  test "should get index" do
    get daycares_url
    assert_response :success
  end

  test "should get new" do
    get new_daycare_url
    assert_response :success
  end

  test "should create daycare" do
    assert_difference('Daycare.count') do
      post daycares_url, params: { daycare: { accreditation_type: @daycare.accreditation_type, added_tags: @daycare.added_tags, additional_info: @daycare.additional_info, address: @daycare.address, ages: @daycare.ages, availability_information: @daycare.availability_information, call_phone: @daycare.call_phone, care_type: @daycare.care_type, center_description: @daycare.center_description, center_tuition: @daycare.center_tuition, center_type: @daycare.center_type, days_open: @daycare.days_open, email: @daycare.email, hours_open: @daycare.hours_open, languages_spoken: @daycare.languages_spoken, name: @daycare.name, rating_count: @daycare.rating_count, rating_score: @daycare.rating_score, religious_affiliations: @daycare.religious_affiliations, spots_available: @daycare.spots_available, student_teacher_ratio: @daycare.student_teacher_ratio, text_phone: @daycare.text_phone, url: @daycare.url, yelp_url: @daycare.yelp_url } }
    end

    assert_redirected_to daycare_url(Daycare.last)
  end

  test "should show daycare" do
    get daycare_url(@daycare)
    assert_response :success
  end

  test "should get edit" do
    get edit_daycare_url(@daycare)
    assert_response :success
  end

  test "should update daycare" do
    patch daycare_url(@daycare), params: { daycare: { accreditation_type: @daycare.accreditation_type, added_tags: @daycare.added_tags, additional_info: @daycare.additional_info, address: @daycare.address, ages: @daycare.ages, availability_information: @daycare.availability_information, call_phone: @daycare.call_phone, care_type: @daycare.care_type, center_description: @daycare.center_description, center_tuition: @daycare.center_tuition, center_type: @daycare.center_type, days_open: @daycare.days_open, email: @daycare.email, hours_open: @daycare.hours_open, languages_spoken: @daycare.languages_spoken, name: @daycare.name, rating_count: @daycare.rating_count, rating_score: @daycare.rating_score, religious_affiliations: @daycare.religious_affiliations, spots_available: @daycare.spots_available, student_teacher_ratio: @daycare.student_teacher_ratio, text_phone: @daycare.text_phone, url: @daycare.url, yelp_url: @daycare.yelp_url } }
    assert_redirected_to daycare_url(@daycare)
  end

  test "should destroy daycare" do
    assert_difference('Daycare.count', -1) do
      delete daycare_url(@daycare)
    end

    assert_redirected_to daycares_url
  end
end

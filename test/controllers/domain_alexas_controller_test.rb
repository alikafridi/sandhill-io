require 'test_helper'

class DomainAlexasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @domain_alexa = domain_alexas(:one)
  end

  test "should get index" do
    get domain_alexas_url
    assert_response :success
  end

  test "should get new" do
    get new_domain_alexa_url
    assert_response :success
  end

  test "should create domain_alexa" do
    assert_difference('DomainAlexa.count') do
      post domain_alexas_url, params: { domain_alexa: { alexa_rank: @domain_alexa.alexa_rank, domain: @domain_alexa.domain } }
    end

    assert_redirected_to domain_alexa_url(DomainAlexa.last)
  end

  test "should show domain_alexa" do
    get domain_alexa_url(@domain_alexa)
    assert_response :success
  end

  test "should get edit" do
    get edit_domain_alexa_url(@domain_alexa)
    assert_response :success
  end

  test "should update domain_alexa" do
    patch domain_alexa_url(@domain_alexa), params: { domain_alexa: { alexa_rank: @domain_alexa.alexa_rank, domain: @domain_alexa.domain } }
    assert_redirected_to domain_alexa_url(@domain_alexa)
  end

  test "should destroy domain_alexa" do
    assert_difference('DomainAlexa.count', -1) do
      delete domain_alexa_url(@domain_alexa)
    end

    assert_redirected_to domain_alexas_url
  end
end

require 'test_helper'

class DomainsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @domain = domains(:one)
  end

  test "should get index" do
    get domains_url
    assert_response :success
  end

  test "should get new" do
    get new_domain_url
    assert_response :success
  end

  test "should create domain" do
    assert_difference('Domain.count') do
      post domains_url, params: { domain: { alexa_rank: @domain.alexa_rank, ancestry: @domain.ancestry, category: @domain.category, comm_platform: @domain.comm_platform, countries: @domain.countries, cover_photo: @domain.cover_photo, description: @domain.description, domain: @domain.domain, funds_raised: @domain.funds_raised, headquarters: @domain.headquarters, logo: @domain.logo, name: @domain.name, status: @domain.status, sub_category: @domain.sub_category, tags: @domain.tags, year_founded: @domain.year_founded } }
    end

    assert_redirected_to domain_url(Domain.last)
  end

  test "should show domain" do
    get domain_url(@domain)
    assert_response :success
  end

  test "should get edit" do
    get edit_domain_url(@domain)
    assert_response :success
  end

  test "should update domain" do
    patch domain_url(@domain), params: { domain: { alexa_rank: @domain.alexa_rank, ancestry: @domain.ancestry, category: @domain.category, comm_platform: @domain.comm_platform, countries: @domain.countries, cover_photo: @domain.cover_photo, description: @domain.description, domain: @domain.domain, funds_raised: @domain.funds_raised, headquarters: @domain.headquarters, logo: @domain.logo, name: @domain.name, status: @domain.status, sub_category: @domain.sub_category, tags: @domain.tags, year_founded: @domain.year_founded } }
    assert_redirected_to domain_url(@domain)
  end

  test "should destroy domain" do
    assert_difference('Domain.count', -1) do
      delete domain_url(@domain)
    end

    assert_redirected_to domains_url
  end
end

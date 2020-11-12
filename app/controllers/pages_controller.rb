class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:uploads]

  def home
    @categories = Category.all.arrange
    @tags = Domain.tag_counts_on(:tags)
    @news = News.where.not(date_published: nil).order("date_published DESC").page(params[:page]).per_page(25)
  end

  def about
  end

  def terms
    @categories = Category.all.arrange
    @tags = Domain.tag_counts_on(:tags)
  end

  def contact
  end

  def uploads
    if params[:createcompanies]
      CreateCompaniesForDomainsJob.perform_later
    end

    if params[:enrich]
      EnrichExistingDomainsJob.perform_later
    end

    if params[:growth]
      CalculateGrowthJob.perform_later
    end

    if params[:news]
      RssFeedJob.perform_later
    end

    if params[:fund_counts_update]
      UpdateCountsJob.perform_later
    end

  end

  def for_providers
  end

  def dashboard
    @domains = Domain.where("alexa_rank < ?", 100000).where("alexa_90day_delta > ?", 0).order(alexa_90day_delta: :desc).page(params[:page]).per_page(50)
  end

  def privacy_policy
  end

  def sitemap
  end

end
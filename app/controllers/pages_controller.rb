class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:uploads]

  def home
    @news = News.where.not(date_published: nil).where(publish: true).order("date_published DESC").page(params[:page]).per_page(25)
  end

  def about
  end

  def terms
    @categories = Category.all.arrange
    @tags = Domain.tag_counts_on(:tags)
  end

  def contact
    @news = News.where.not(date_published: nil).where(publish: true).where("date_published >= ?", 4.days.ago).order("date_published DESC").page(params[:page]).per_page(50)
  end

  def uploads
    if params[:news]
      RssFeedJob.perform_later
    end

    if params[:update_flags]
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

  def talent
  end

end
class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:uploads]

  def home
    @news = News.where.not(date_published: nil).where(publish: true).order("date_published DESC").page(params[:page]).per_page(25)
    @top = @news.where("date_published >= ?", 8.days.ago).where("upvotes >= ?", 0).order("upvotes DESC")
    @lead = Lead.new
  end

  def about
    @news = News.where.not(date_published: nil).where(publish: true).order("date_published DESC").page(params[:page]).per_page(25)
    @top = News.where.not(date_published: nil).where(publish: true).where("date_published >= ?", 8.days.ago).where("upvotes >= ?", 0).order("upvotes DESC")
  end

  def terms
    @categories = Category.all.arrange
    @tags = Domain.tag_counts_on(:tags)
  end

  def emails
    @news = News.where.not(date_published: nil).where(publish: true).where("date_published >= ?", 8.days.ago).order("date_published DESC")
  end

  def uploads
    if params[:news]
      RssFeedJob.perform_later
    end

    if params[:update_flags]
      UpdateCountsJob.perform_later
    end

    if params[:update_categories]
      UpdateCategoriesJob.perform_later
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

  def loader
  end
end
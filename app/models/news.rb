class News < ApplicationRecord
	include ApplicationHelper
  extend FriendlyId
  friendly_id :title, use: :slugged

	validates :title, presence: true
	validates :article_link, uniqueness: true

	acts_as_taggable_on :tags

	belongs_to :feed, optional: true

	before_save do
  	self.article_link = sanitize_url2(article_link)
	end

	before_create do
  	self.article_link = sanitize_url2(article_link)
	end
end

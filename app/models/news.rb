class News < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

	validates :title, presence: true
	validates :article_link, uniqueness: true
	acts_as_taggable_on :tags

	belongs_to :feed, optional: true
end
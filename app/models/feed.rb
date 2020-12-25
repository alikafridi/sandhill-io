class Feed < ApplicationRecord
	acts_as_taggable_on :tags

	has_many :news
	has_and_belongs_to_many :categories

	validates :follow_url, uniqueness: true
end
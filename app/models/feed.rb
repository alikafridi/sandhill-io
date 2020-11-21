class Feed < ApplicationRecord
	acts_as_taggable_on :tags

	has_many :news
end
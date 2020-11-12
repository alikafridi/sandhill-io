class Feed < ApplicationRecord
	acts_as_taggable_on :tags
end
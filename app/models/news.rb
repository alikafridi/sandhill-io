class News < ApplicationRecord
	validates :title, presence: true
	validates :article_link, uniqueness: true
end

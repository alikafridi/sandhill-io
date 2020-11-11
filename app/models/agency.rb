class Agency < ApplicationRecord
	has_and_belongs_to_many :categories
	#friendly_id :name, use: :slugged

	validates :domain, presence: true
	validates :domain, uniqueness: true

	before_save do
  	self.domain = sanitize_url(domain)
	end

	before_create do
  	self.domain = sanitize_url(domain)
	end

	def sanitize_url(domain)
    domain.gsub!("https://", "")
    domain.gsub!("http://", "")
    domain.gsub!("www.", "")
    domain = domain.split("?")[0]
    domain = domain.split("/")[0]
    domain
	end

end

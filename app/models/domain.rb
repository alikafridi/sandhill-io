require 'shared_functions'

class Domain < ApplicationRecord
	extend FriendlyId
	include SharedFunctions
	include ApplicationHelper

	searchkick text_start: [:domain]

	has_many :domain_categories
	has_many :categories, through: :domain_categories
	accepts_nested_attributes_for :domain_categories

	has_and_belongs_to_many :locations

	has_many :domain_alexas

	belongs_to :company, optional: true

  acts_as_taggable_on :tags
  friendly_id :domain, use: :slugged
	validates :domain, presence: true
	validates :domain, uniqueness: true

	before_save do
  	self.domain = sanitize_url(domain)
	end

	before_create do
  	self.domain = sanitize_url(domain)
	end
=begin
	after_create do 
		DomainEnrichJob.set(wait: 3).perform_later(self.domain)
    AlexaPullJob.set(wait: 3).perform_later(self.domain)
	end 
=end

	def self.to_csv(options= {})
  	CSV.generate(options) do |csv|
  		csv << column_names

  		all.each do |c|
  			csv << c.attributes.values_at(*column_names)
  			# csv << c.category_ids
  		end
		end
  end

	def should_generate_new_friendly_id?
 		domain_changed?
	end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			begin
			r_hash = row.to_hash
			d_url = row["domain"].to_s

			p "domain"
			p d_url

			if !d_url.blank?
				d_url.gsub!("https://", "")
		    d_url.gsub!("http://", "")
		    d_url.gsub!("www.", "")
		    d_url = d_url.split("?")[0]
		    d_url = d_url.split("/")[0]
	  	end

  		enrich = false
  		d = Domain.find_by(domain: d_url) || new

			d.attributes = r_hash
			d.save!
			rescue
			end

		end
	end
end
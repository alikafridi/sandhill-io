require 'shared_functions'

class Company < ApplicationRecord
	extend FriendlyId
	include SharedFunctions	
  
	has_many :domains
	has_many :mobile_apps
	belongs_to :category, optional: true

  friendly_id :name, use: :slugged
  validates :name, presence: true
  
  has_many :linkedin_counts

  validates :main_domain, uniqueness: true

  def self.to_csv(options= {})
  	CSV.generate(options) do |csv|
  		csv << column_names

  		all.each do |c|
  			csv << c.attributes.values_at(*column_names)
  		end
		end
  end

	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
			begin
				r_hash = row.to_hash
				d_url = row["main_domain"]

				p "domain"
				p d_url
				if !d_url.blank?
					d_url.gsub!("https://", "")
			    d_url.gsub!("http://", "")
			    d_url.gsub!("www.", "")
			    d_url = d_url.split("?")[0]
			    d_url = d_url.split("/")[0]
		  	end

		  	c_name = row["name"]

		  	c = Company.find_by(main_domain: d_url) || new
		  	c.attributes = r_hash
		  	c.save!

	  		d = Domain.find_by(domain: d_url) || new
				
				if d.name.blank? && !c_name.blank?
					d.name = c_name
				end
				d.save!
			rescue
			end
			

		end
	end
end
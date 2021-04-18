class Feed < ApplicationRecord
	acts_as_taggable_on :tags
	geocoded_by :address

	after_validation :geocode, :if => :address_changed?

	has_many :news
	has_and_belongs_to_many :categories

	validates :follow_url, uniqueness: true

	searchkick

	def self.to_csv(options= {})
  	CSV.generate(options) do |csv|
  		csv << column_names

  		all.each do |c|
  			csv << c.attributes.values_at(*column_names)
  		end
		end
  end

	def self.import(file)
		CSV.foreach(file.path, headers: true, header_converters: :symbol) do |row|
			begin
				r_hash = row.to_hash
				f_url = row[:url].to_s

				p "feed"
				p f_url

	  		f = Feed.find_by(url: f_url) || new
	  		p f.name
				f.attributes = row.to_hash.slice(:name, :url, :auto_public, :primary_role, :email_descript, :firm_name, :follow_url, :description, :default_author, :address)
#				p row.to_hash.slice(:name, :url, :auto_public, :primary_role, :email_descript, :firm_name, :follow_url, :description, :default_author, :address)
#				p "test"
				f.save!
#				p "done"
			rescue Exception => e
				p e.message 
			end
		end
	end
end
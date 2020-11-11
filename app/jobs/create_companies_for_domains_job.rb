class CreateCompaniesForDomainsJob < ApplicationJob
	include ApplicationHelper
  queue_as :default

  def perform()
  	# Get all domains that do not have an associated company
  	# For each domain without associated company, create a new company
  	# Take the whole domain and make that the main domain and company name 
  		# (will make it easier to see which ones need to be cleaned up)
		# Link the domain to the company
  	domains = Domain.where(company_id: [nil, ""])

  	domains.each do |d_f|
			begin
  			d = Domain.find(d_f.id)
	  		c = Company.new
	  		
	  		c.main_domain = d.domain

	  		if d.name.blank?
	  			c.name = d.domain
	  		else
	  			c.name = d.name
	  		end

	  		c.save!
	  		d.company_id = c.id
	  		d.save!
	  	rescue
	  		p "rescued: #{d_f.id}"
	  	end
  	end
=begin
  	companies = Company.all
  	companies.each do |c_i|
  		begin
	  		c = Company.find(c_i.id)
	  		d = c.domains.first
  			c.main_domain = d.domain
  			c.save!
  		rescue => error
	  		p "rescued: #{c_i.id}"
	  		p error
	  	end
  	end
=end
  end

end
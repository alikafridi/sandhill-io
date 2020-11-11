class UpdateCountsJob < ApplicationJob
  include ApplicationHelper
  queue_as :default

  def perform()

  	# Take the employee count and add it to domains
  	ds = Domain.all
  	ds.each do |d|
  		begin
	  		c_id = d.company_id
  			l_count = LinkedinCount.where(company_id: c_id).order("date DESC").first || LinkedinCount.where(domain: d.domain).order("date DESC").first
  			d.employee_count = l_count.employee_count
  			d.save!
  			
  			c = Company.find(c_id)
 	 			
 	 			c.employee_count = l_count.employee_count
  			d.funds_raised = c.capital_raised

				d.save!
  			c.save!

  		rescue
  		end
  	end
  		# Go through every domain
  		# Find the most recent linkedin_count by date associated with the associated company and get employee_count
			# Find the associated company from the linkedin_count and add the count to it
  		# If none are found, find the employee_count associated with the domain
  		# Update domains employee count with above if found
	  	# Take the funds_raised from company and add it to domains from companies


  	# LATER – Calculate the employee count growth

=begin
    ds = Domain.all

    ds.each do |d|
      initial_rank = -1
      ninety_day_old_rank = -1

      p "Domain: #{d.domain}"

      begin        
        if d.alexa_rank > 0
          initial_rank = d.alexa_rank 
          p "Initial Rank: #{initial_rank}"
        end 

        begin 
          alexa_counts = DomainAlexa.where(domain_id: d.id).where("date > ?", 90.days.ago)
          ninety_day_old_rank = alexa_counts.first.alexa_rank 
          p "90 day old Rank: #{ninety_day_old_rank}"
        rescue
        end   

        if initial_rank != -1 && ninety_day_old_rank != -1
          ninety_delta = ninety_day_old_rank - initial_rank
          d.alexa_90day_delta = ninety_delta
          d.save
          p "90 day delta: #{ninety_delta}"
        end
      rescue 
      end

    end
=end 

  end
end
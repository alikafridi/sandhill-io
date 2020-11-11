class CalculateGrowthJob < ApplicationJob
  include ApplicationHelper
  queue_as :default

  def perform()

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

  end
end
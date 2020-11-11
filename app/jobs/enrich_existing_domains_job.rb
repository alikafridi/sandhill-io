require 'open-uri'
require 'nokogiri'
require 'json'
require 'shared_functions'

# This job is for controlling Alexa Pulls and Domain Enriched for URLs that are already in the system... 

class EnrichExistingDomainsJob < ApplicationJob
  include SharedFunctions
  queue_as :default

  def perform()
  	alexa_day_counter = 30
    enrich_day_counter = 45

  	da = Domain.where('alexa_enriched <= ?', Time.zone.now - alexa_day_counter.days)
  	da.each do |d|
      begin 
    		p d.domain
        alexa_pull_func(d.domain)
      rescue
        p "Rescued for #{d.domain}"
      end
  	end

    da = Domain.where(alexa_enriched: nil)
    da.each do |d|
      begin
        p d.domain
        alexa_pull_func(d.domain)
      rescue
        p "Rescued for #{d.domain}"
      end
    end

    de = Domain.where('domain_enriched <= ?', Time.zone.now - enrich_day_counter.days)
    de.each do |d|
      begin
        p d.domain
        #DomainEnrichJob.perform_later(d.domain)
        domain_enrich_func(d.domain)
      rescue
        p "Rescued for #{d.domain}"
      end
    end

    de = Domain.where(domain_enriched: nil)
    de.each do |d|
      begin 
        p d.domain
        #DomainEnrichJob.perform_later(d.domain)
        domain_enrich_func(d.domain)
      rescue
        p "Rescued for #{d.domain}"
      end
    end
  end
end
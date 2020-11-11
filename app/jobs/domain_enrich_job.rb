require 'open-uri'
require 'nokogiri'
require 'json'
require 'shared_functions'

class DomainEnrichJob < ApplicationJob
	include ApplicationHelper
	include SharedFunctions
  queue_as :default

  def perform(domain_url)
  	begin 
	  	n = domain_enrich_func(domain_url)
	  rescue => e
	  	p "Rescued in DomainEnrichJob: #{domain_url}"
	  	puts "An error of type #{e.class} happened, message is #{e.message}"
	  end 
  end
end
require 'awis'
require 'nokogiri'
require 'json'
require 'open-uri'
require 'shared_functions'

class AlexaPullJob < ApplicationJob
  include ApplicationHelper
  include SharedFunctions
  queue_as :default

  def perform(domain_url)
  	begin
  		alexa_pull_func(domain_url)
  	rescue => e
	  	p "Rescued in AlexaPullJob: #{domain_url}"
      puts "An error of type #{e.class} happened, message is #{e.message}"
	  end 
  end
end
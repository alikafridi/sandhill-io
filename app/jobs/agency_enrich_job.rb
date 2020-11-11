require 'open-uri'
require 'nokogiri'
require 'json'

class AgencyEnrichJob < ApplicationJob
	include ApplicationHelper
  queue_as :default

  def perform(a_domain)

  	p a_domain

    a = Agency.find_by(domain: a_domain)
  	puts "Ran The Enrich Job!"
  	

  	d = a.domain
		p d

  	begin 
  		url = "http://" + d
			page = Nokogiri::HTML(open(url, 'User-Agent' => 'firefox'))
		rescue
			url = "https://" + d
			page = Nokogiri::HTML(open(url, 'User-Agent' => 'firefox'))
		end

		descript = a.description

		begin 
			des = page.at('meta[name="description"]')['content']
			descript = des
		rescue
			puts "rescued"
		end

		begin 
			des = page.at('meta[property="og:description"]')['content']
			descript ||= des
		rescue
			puts "rescued"
		end

		a.description = descript
		a.save	

  end
end

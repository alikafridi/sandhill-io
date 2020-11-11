require 'awis'
require 'nokogiri'
require 'json'
require 'open-uri'

module SharedFunctions
  def sanitize_url(domain)
    domain.gsub!("https://", "")
    domain.gsub!("http://", "")
    domain.gsub!("www.", "")
    domain = domain.to_s.downcase
    domain = domain.split("?")[0]
    domain = domain.split("/")[0]
    domain
	end

	def test_function(domain)
		d = Domain.find_by(domain: "twitter.com")
		d.name = "tweeter2"
		d.save!
		d.name
	end

	def domain_enrich_func(domain_url)
  	domain_url = sanitize_url(domain_url)

    d = Domain.find_by(domain: domain_url)
  	puts "Ran The Enrich Job!"
  	url = "http://" + d.domain
		
		begin
			page = Nokogiri::HTML(open(url, 'User-Agent' => 'firefox'))
		rescue
			url = "https://" + d.domain
			page = Nokogiri::HTML(open(url, 'User-Agent' => 'firefox'))
		end

		d.domain_enriched = Time.now
		d.save

		# Get the description if there wasn't one last time
		if d.description.blank?
			descript = d.description
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

			d.description = descript
			d.save
		end

		# Get the platform
		technologies = [['Shopify', 'cdn.shopify.'], ['BigCommerce', 'cdn11.bigcommerce.com'], ['Demandware', 'demandware.static'], ['Demandware', 'demandware.store'], ['Wix', 'wix.com'], ['BigCartel', 'bigcartel.com'], ['Volusion', 'volusion.js']]

		tech_list = ""
		start = true

		technologies.each do |t|
			if (page.content.include? t[1])
				p t[0]
				tech_list << t[0] 
				if start
					tech_list << ", "
				end
				start = false
			end
		end
		d.platform = tech_list
		d.save
	end

	def alexa_pull_func(domain_url)
  	domain_url = sanitize_url(domain_url)
  	
  	Awis.config do |c|
		  c.access_key_id = ENV["awis_access_key"]
		  c.secret_access_key = ENV["awis_secret_key"]
		  c.debug = 'debug'
		  c.protocol = 'https'    # Default 'https'
		  c.timeout = 10          # Default 10
		  c.open_timeout = 10     # Default 10
		  c.logger = false        # Default nil
		end

  	d = Domain.find_by(domain: domain_url)
  	puts "Ran The Job!"
  	puts d.domain
  	d.alexa_enriched = Time.now
  	d.save

		client = Awis::Client.new
		url_info = client.url_info(url: d.domain)

		p url_info.data_url
		p url_info.rank
		rank = url_info.rank

		#d.alexa_rank = rank
		#d.save

		#da = DomainAlexa.new(:domain_url => domain_url, :alexa_rank => rank, :domain_id => d.id, :date => Time.now)
		#da.save

		begin 
			# Get all the past histories from the Alexa call and save them as well!
			doc = url_info.xml.data
			doc = Nokogiri::XML doc
			doc = doc.to_xml

			url_json = Hash.from_xml(doc)
			traffic_json = url_json["UrlInfoResponse"]["Response"]["UrlInfoResult"]["Alexa"]["TrafficData"]["UsageStatistics"]["UsageStatistic"]

			traffic_json.each do |el|

				if (el["TimeRange"]["Days"] != nil)
					t = Time.now - el["TimeRange"]["Days"].to_i.days
				elsif (el["TimeRange"]["Months"] != nil)
					t = Time.now - el["TimeRange"]["Months"].to_i.months
				end

				date = t
				rank_value = el["Rank"]["Value"].to_i
				reach_rank_value = el["Reach"]["Rank"]["Value"].to_i
				reach_per_million_value = el["Reach"]["PerMillion"]["Value"].to_f
				page_views_rank_value = el["PageViews"]["Rank"]["Value"].to_i
				page_views_per_million_value = el["PageViews"]["PerMillion"]["Value"].to_f
				page_views_per_user_value = el["PageViews"]["PerUser"]["Value"].to_f

				da = DomainAlexa.new(:domain_url => domain_url, :alexa_rank => rank_value, :domain_id => d.id, :reach_rank_value => reach_rank_value, :reach_per_million_value => reach_per_million_value, :page_views_rank_value => page_views_rank_value, :page_views_per_million_value => page_views_per_million_value, :page_views_per_user_value => page_views_per_user_value, :date => date)
				da.save
			end
		rescue 
			p "Log - Rescued in Alexa Pull Job"
		end

		begin 
			alexa_count = DomainAlexa.where(domain_id: d.id).order('date DESC').first
			rank = alexa_count.alexa_rank
			d.alexa_rank = rank
			d.save

			views_per_mill = alexa_count.reach_per_million_value
			reach_per_mill = alexa_count.page_views_per_million_value
			d.reach_views_per_million = reach_per_mill
			d.page_views_per_million = views_per_mill
			d.save
		rescue
			p "Log 2 - Rescued in Alexa Pull Job"
		end
	end

end
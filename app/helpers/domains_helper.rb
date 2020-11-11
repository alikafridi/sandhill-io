module DomainsHelper
	def alexa_rank_range_name(bucket)
    if bucket["from"] && bucket["to"]
      "#{bucket["from"]} - #{bucket["to"]}"
    elsif bucket["from"]
      "#{bucket["from"]} & Above"
    elsif bucket["to"]
      "#{bucket["to"]} & Below"
    else
      bucket["key"]
    end
  end
end

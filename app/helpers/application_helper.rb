module ApplicationHelper
	def markdown(content)
		renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
		options = {
			autolink: true,
			no_intra_emphasis: true,
			disable_indented_code_blocks: true,
			fenced_code_blocks: true,
			lax_html_blocks: true,
			strikethrough: true,
			superscript: true
		}
		Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end

  def site_name
  	ENV['app_name'].to_s
  end

  def site_industry
  	ENV['app_descript'].to_s
  end

  def sanitize_url(domain)
  	# Clean Up the URL to take out anything besides the main domain    
    domain.gsub!("https://", "")
    domain.gsub!("http://", "")
    domain.gsub!("www.", "")
    domain = domain.to_s.downcase
    domain = domain.split("?")[0]
    domain = domain.split("/")[0]
    return domain
  end

  def sanitize_url2(domain)
    domain = domain.to_s.downcase
    domain = domain.split("?")[0]
    return domain
  end

  def collection_for_parent_select
    @categories = ancestry_options(Category.unscoped.arrange(:order => 'name')) {|i| "#{'-' * i.depth} #{i.name}" }
  end

  def ancestry_options(items)
    result = []
    items.map do |item, sub_items|
      result << [name: yield(item), id: item.id]
      #this is a recursive call:
      result += ancestry_options(sub_items) {|i| "#{'-' * i.depth} #{i.name}" }
    end
    result
  end


end

class UpdateCategoriesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Will go through and add categories from parent feed to the news stories that that are under it. 
    # The If on line 12 currently keeps it to only news where there is no category_ids already
    
    ns = News.all

    p "Categories called!"
    ns.each do |n|
    	begin
    		if n.category_ids.empty?
		    	f = Feed.find(n.feed_id)
  	  		n.category_ids += f.category_ids
    			n.category_ids = n.category_ids.uniq
    			n.save
    		end
    	rescue
    	end
    end
  end
end
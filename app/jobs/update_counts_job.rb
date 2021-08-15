class UpdateCountsJob < ApplicationJob
  include ApplicationHelper
  queue_as :default

  def perform()

    # 1 - Go through all news and turn the flag to true for any that are nil
    ns = News.where(publish: nil)
    ns.each do |n|
      n.publish = true
      n.save
    end

    #2 – Go through all feeds and if publisher_description is nil, change it to feed_description
    fs = Feed.all
    fs.each do |f|
      begin
        if f.email_descript.nil?
          f.email_descript = f.default_author + ", " + f.primary_role
        end
      rescue
      end
    end

    #3 - Remove duplicates ; Update all feed urls & descriptions
    # Update all news with the latest vote counts based on parent feed's upvotes and make each news non-core that is from a feed that is non-investor
    ns = News.all
    ns.each do |n|
      # Remove duplicates
      n2 = News.find_by(article_link: n.article_link)
      if n2.id != n.id 
        n2.destroy
      end

      # Update feed urls + descriptions
      begin 
        f = Feed.find(n.feed_id)
        n.feed_url = f.follow_url
        n.feed_description = f.description
        n.publisher_description = f.email_descript
        n.save
      rescue
      end

      # Votes + Non Core
      begin
        f = Feed.find(n.feed_id)
        if n.upvotes.nil?
          n.upvotes = f.votes
        end
        n.non_core = f.non_investor
        n.save
      rescue
      end

    end
    
    # 4 - Go through all news and if description is empty, feed in description of it's feed (if there is a feed)
    # Also update any descriptions for feeds that have been stored... (for authors / publications)
    # TODO

  end
end
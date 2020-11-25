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

    # 2 - Go through all news and if description is empty, feed in description of it's feed (if there is a feed)
    # Also update any descriptions for feeds that have been stored... (for authors / publications)
    # TODO


    #3 - Remove duplicates
    ns = News.all
    ns.each do |n|
      n2 = News.find_by(article_link: n.article_link)
      if n2.id != n.id 
        n2.destroy
      end
    end

  end
end
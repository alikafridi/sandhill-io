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

  end
end
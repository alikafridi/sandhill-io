require 'rss'
require 'open-uri'

class RssFeedJob < ApplicationJob
  include ApplicationHelper
  queue_as :default


  def fix(text)
    replacements = [
      ['â€“',           "—"],
      ["â€”",           "–"],
      ["â€˜",           "‘"],
      ['â€¦',           '…'],
      ['â€™',           '’'],
      ['â€œ',           '“'],
      [/â€[[:cntrl:]]/, '”'],
      ['â€?',           '”'],
      ['â€ť',           '”'],
      ['â€ś',           '“'],
      ['â€¨',           '—'], # not sure about this one
      ['â€ł',           '″'],
      ['â€Ž',           ''], # emtpy str
      ['â€‚',           ''], # emtpy str
      ['â€‰',           ''], # emtpy str
      ['â€‹',           ''], # emtpy str
      ['â€',           ''], # emtpy str
      ["â€s'",           ''], # emtpy str
    ]
    new_text = text
    replacements.each { |set| new_text = new_text.gsub(set[0], set[1]) }
    new_text
  end


  def perform()
    feeds = Feed.all

    feeds.each do |f|

      open(f.url) do |rss|
        begin
          feed = RSS::Parser.parse(rss)
          puts "Title: #{feed.channel.title}"
          feed.items.each do |item|
            n = News.new
            n.title = fix(item.title)
            n.article_link = sanitize_url2(item.link)
            n.publisher = f.name
            n.description = item.description # pot
            begin
              n.date_published = item.pubDate # pot
              n.author = f.default_author
              n.tag_list = f.tag_list
            rescue
            end
            
            if n.date_published.blank?
              n.date_published = Time.now
            end

            n.feed_id = f.id
            n.publish = true
            #if f.
              #n.public = true
            #end
            n.save
          end
        rescue
        end
      end
      
    end
  end
end
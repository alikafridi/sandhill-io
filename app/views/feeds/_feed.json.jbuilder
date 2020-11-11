json.extract! feed, :id, :name, :url, :auto-public, :created_at, :updated_at
json.url feed_url(feed, format: :json)

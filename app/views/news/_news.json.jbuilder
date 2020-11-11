json.extract! news, :id, :title, :article_link, :description, :upvotes, :tags, :created_at, :updated_at
json.url news_url(news, format: :json)

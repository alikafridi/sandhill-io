json.extract! blog, :id, :title, :content, :author, :date, :image, :tags, :created_at, :updated_at
json.url blog_url(blog, format: :json)

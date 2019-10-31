json.extract! article, :id, :title, :keywords, :url, :created_at, :updated_at
json.url article_url(article, format: :json)

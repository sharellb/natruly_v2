json.array!(@blogs) do |blog|
  json.extract! blog, :id, :feed
  json.url blog_url(blog, format: :json)
end

json.array!(@videos) do |video|
  json.extract! video, :id, :link, :title, :author,  :uid
  json.url video_url(video, format: :json)
end

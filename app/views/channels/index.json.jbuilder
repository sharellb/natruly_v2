json.array!(@channels) do |channel|
  json.extract! channel, :id, :username
  json.url channel_url(channel, format: :json)
end

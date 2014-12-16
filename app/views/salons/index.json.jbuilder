json.array!(@salons) do |salon|
  json.extract! salon, :id, :address, :name, :description, :website, :phone_number
  json.url salon_url(salon, format: :json)
end

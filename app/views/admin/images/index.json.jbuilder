json.array!(@images) do |image|
  json.extract! image, :id, :uniqid, :title, :capture, :url, :device_id
  json.url image_url(image, format: :json)
end

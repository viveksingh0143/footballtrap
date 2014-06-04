json.array!(@videos) do |video|
  json.extract! video, :id, :uniqid, :title, :capture, :url, :device_id
  json.url video_url(video, format: :json)
end

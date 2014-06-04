json.array!(@audios) do |audio|
  json.extract! audio, :id, :uniqid, :title, :capture, :url, :device_id
  json.url audio_url(audio, format: :json)
end

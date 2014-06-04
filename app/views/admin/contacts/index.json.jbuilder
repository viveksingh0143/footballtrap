json.array!(@contacts) do |contact|
  json.extract! contact, :id, :uniqid, :number, :name, :device_id
  json.url contact_url(contact, format: :json)
end

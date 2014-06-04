json.array!(@messages) do |message|
  json.extract! message, :id, :uniqid, :contact, :msg_type, :message, :time, :device_id
  json.url message_url(message, format: :json)
end

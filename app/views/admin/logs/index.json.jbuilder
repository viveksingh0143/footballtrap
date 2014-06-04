json.array!(@logs) do |log|
  json.extract! log, :id, :uniqid, :contact, :log_type, :time, :duration, :device_id
  json.url log_url(log, format: :json)
end

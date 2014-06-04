json.array!(@apps) do |app|
  json.extract! app, :id, :program, :version, :package, :device_id
  json.url app_url(app, format: :json)
end

json.array!(@devices) do |device|
  json.extract! device, :id, :name, :imei, :serial_number, :devise_type, :os, :hardware_platform, :platform_string, :total_memory, :total_disk, :free_disk_space, :user_id
  json.url device_url(device, format: :json)
end

class Video < ActiveRecord::Base
  belongs_to :device
  validates :device, presence: true
  before_validation :set_device, on: :create

  mount_uploader :url, VideoUploader
  
  def device_imei=(device_imei)
    @device_imei = device_imei
  end

  def device_imei
    @device_imei
  end

  def set_device
    if !device_id.present? && device_imei.present?
      self.device_id = Device.find_by_imei(device_imei).id
    end
  end
end

class App < ActiveRecord::Base
  belongs_to :device
  validates :program, :presence => true, uniqueness: { case_sensitive: false, scope: :package, message: "should exists once per package" }
  
  validates :device, presence: true
  
  before_validation :set_device, on: :create
  
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

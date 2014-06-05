class Location < ActiveRecord::Base
  belongs_to :device
  
  validates :device, presence: true
  
  before_validation :set_device, on: :create
  before_validation :set_travel, on: [:create, :update]

  geocoded_by :address        # can also be an IP address
  after_validation :geocode   # auto-fetch coordinates

  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  
  def device_imei=(device_imei)
    @device_imei = device_imei
  end

  def device_imei
    @device_imei
  end

  def set_travel
    last_location = self.device.locations
    if self.id
      last_location = last_location.where("id < ?", self.id)
    end
    last_location = last_location.last
    if last_location
      self.travel = self.distance_from([last_location.latitude, last_location.longitude])
      if last_location.travel
        self.travel += last_location.travel
      end
    else
      self.travel = 0
    end
  end
  
  def set_device
    if !device_id.present? && device_imei.present?
      self.device_id = Device.find_by_imei(device_imei).id
    end
  end
end

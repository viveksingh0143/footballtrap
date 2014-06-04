class Message < ActiveRecord::Base
  belongs_to :device
  belongs_to :contact
  
  validates :device, presence: true
  validates :contact, presence: true
  
  before_validation :set_device, on: :create
  before_validation :set_contact, on: :create
  
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
  
  def contact_number=(contact_number)
    @contact_number = contact_number
  end

  def contact_number
    @contact_number
  end

  def set_contact
    if !contact_id.present? && contact_number.present?
      contact = Contact.find_by_number(contact_number)
      if !contact
        contact = Contact.new
        contact.uniqid = contact_number
        contact.number = contact_number
        contact.name = contact_number
        contact.device = self.device
        contact.save
      end
      self.contact_id = contact.id
    end
  end
end

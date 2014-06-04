class Device < ActiveRecord::Base
  has_many :apps
  has_many :contacts
  has_many :locations
  has_many :logs
  has_many :messages
  has_many :images
  has_many :audios
  has_many :videos

  belongs_to :user
  validates :name, presence: true
  validates :devise_type, presence: true
  validates :imei, presence: true, uniqueness: { case_sensitive: false }
end

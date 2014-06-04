class Form < ActiveRecord::Base
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :name, :presence => true, :length => { :in => 3..55}
  validates :subject, :presence => true, :length => { :in => 3..55}
  validates :email, :presence => true, :format => EMAIL_REGEX
  validates :phone, :presence => true, :length => { :in => 3..55}
  validates :message, presence: true
end

class Page < ActiveRecord::Base
  include Bootsy::Container

  validates :title, presence: true
  validates :slug, presence: true, uniqueness: { case_sensitive: false }
end

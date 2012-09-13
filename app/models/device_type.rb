class DeviceType < ActiveRecord::Base
  validates :device_type, :presence => true

  has_one :device
end

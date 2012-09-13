class DeviceCarrier < ActiveRecord::Base
  validates :device_carrier, :presence => true

  has_many :device
end

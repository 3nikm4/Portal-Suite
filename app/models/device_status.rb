class DeviceStatus < ActiveRecord::Base
	validates :device_status, :presence => true

	has_many :device
end

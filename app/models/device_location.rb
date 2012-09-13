class DeviceLocation < ActiveRecord::Base
  validates :location_id, :presence => true

  belongs_to :device
  belongs_to :location
end

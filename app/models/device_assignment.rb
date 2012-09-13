class DeviceAssignment < ActiveRecord::Base

  validates :start_date, :presence => true
#  validates :end_date, :presence => true
  validates :device_id, :presence => true


  belongs_to :device
  belongs_to :location
  belongs_to :patient

end

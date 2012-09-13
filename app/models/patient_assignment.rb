class PatientAssignment < ActiveRecord::Base
  validates :device_id, :presence => true
  validates :patient_id, :presence => true

  belongs_to :patient
  belongs_to :device
end

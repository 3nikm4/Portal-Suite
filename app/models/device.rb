class Device < ActiveRecord::Base
  validates :device_carrier_id, :presence => true
  validates :device_type_id, :presence => true
  validates :device_status_id, :presence => true
  validates :serial_number, :presence => true, :uniqueness => true

  belongs_to :device_type
  belongs_to :device_status
  belongs_to :device_carrier
  has_many :device_battery, :dependent => :destroy
  has_many :device_test, :dependent => :destroy
#  has_many :device_location, :dependent => :destroy
  has_many :device_problem_statuses, :through => :device_problem
  has_many :device_problems, :dependent => :destroy
  has_many :audits, :dependent => :destroy
  has_many :patients
  has_many :device_assignments, :dependent => :destroy
#  has_many :patient_assignments, :through => :patients
#  has_many :patient_assignments

  accepts_nested_attributes_for :device_problems, :device_test, :device_battery, :allow_destroy => true
end

class Practice < ActiveRecord::Base
  validates :practice_name, :presence => true
  
  has_many :locations, :dependent => :destroy
  has_many :patients, :through => :locations
  has_many :devices, :through => :patients
  has_many :device_assignments, :through => :patients
  
  accepts_nested_attributes_for :locations, :patients, :devices, :device_assignments
end

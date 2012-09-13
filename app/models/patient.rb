class Patient < ActiveRecord::Base
  validates :location_id, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
#  validates :address_street1, :presence => true
#  validates :address_city, :presence => true
#  validates :address_state, :presence => true
#  validates :address_zip, :presence => true
  validates :dob, :presence => true
  
  belongs_to :location
  has_many :device_assignments, :dependent => :destroy
  
  accepts_nested_attributes_for :device_assignments, :location
  
  #for use to make patient name easy
  def patient_full_name
    first_name + " " + last_name
  end

  #used in patient assignment dropdown
  def full_name_location
    first_name + " " + last_name + " - " + location.location_name
  end
end

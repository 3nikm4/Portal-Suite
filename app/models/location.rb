class Location < ActiveRecord::Base
  validates :location_type_id, :presence => true
  validates :location_name, :presence => true
  validates :location_street1, :presence => true
  validates :location_city, :presence => true
  validates :location_state, :presence => true
  validates :location_zip, :presence => true
  validates :location_contact, :presence => true
  validates :par_level_event, :presence => true
  validates :par_level_mct, :presence => true
  validates :alert_amount, :presence => true
  
  belongs_to :location_type
  belongs_to :practice
  has_many :location_alert_contacts, :dependent => :destroy
#  has_many :location_assignments
  has_many :device_locations
  has_many :devices, :through => :device_assignments
#  has_many :devices, :through => :patient_assignments
  has_many :patients
#  has_many :patient_assignments, :through => :patients
  has_many :device_assignments, :dependent => :destroy

  
  accepts_nested_attributes_for :location_alert_contacts, :device_assignments
  
  def active_devices
#    device_locations.where( :active => TRUE ).first.location.devices
#    device_locations.first.location.devices.where( "`device_locations`.`active` = 1" )
#    devices.joins(:device_type).where( "`device_locations`.`active` = 1" ).order( "`device_types`.`device_type` ASC" )
    devices.joins(:device_type).where( "`device_assignments`.`returned_date` IS NULL AND `device_assignments`.`start_date` IS NOT NULL" ).order( "`device_types`.`device_type` ASC" )
  end

  def active_patients
#    patients.all
    patients.joins(:device_assignments).where( "`device_assignments`.`returned_date` IS NULL AND `device_assignments`.`start_date` IS NOT NULL" )
  end
  
  def devices_count
#    device_locations.where( :active => TRUE ).first.location.devices.count

    device_assignments.where( "returned_date IS NULL AND location_id IS NOT NULL and start_date IS NOT NULL" ).first.location.devices.count
  end
  
  def get_patients
#    device_locations.where( :active => TRUE ).first.location.patients.all

    device_assignments.where( "returned_date IS NULL AND patient_id IS NOT NULL and start_date IS NOT NULL" ).first.location.patients.all
  end
  
  def get_devices
#    device_locations.where( :active => TRUE ).first.location.devices.all

    device_assignments.where( "returned_date IS NULL AND location_id IS NOT NULL and start_date IS NOT NULL" ).first.location.devices.all
  end

  def mct_devices
#    device_locations.where( :active => TRUE ).first.location.devices.where( :device_type_id => 1 )

    device_assignments.where( "returned_date IS NULL AND location_id IS NOT NULLand start_date IS NOT NULL" ).first.location.devices.where( :device_type_id => 1 )
  end

  def scottcare_devices
#    device_locations.where( :active => TRUE ).first.location.devices.where( :device_type_id => 9 )

    device_assignments.where( "returned_date IS NULL AND location_id IS NOT NULL and start_date IS NOT NULL" ).first.location.devices.where( :device_type_id => 9 )
  end

  def event_devices
#    device_locations.where( :active => TRUE ).first.location.devices.where( :device_type_id => 2 )

    device_assignments.where( "returned_date IS NULL AND location_id IS NOT NULL and start_date IS NOT NULL" ).first.location.devices.where( :device_type_id => 2 )
  end
  
  def mct_count
#    if !device_locations.empty?
#      device_locations.first.location.devices.where( "device_type_id = 1 AND `device_locations`.`active` = 1" ).count
#    else
#      return 0
#    end

    if !device_assignments.empty?
      device_assignments.first.location.devices.where( "`devices`.`device_type_id` = 1 AND `device_assignments`.`returned_date` IS NULL and start_date IS NOT NULL" ).count
    else
      return 0
    end
  end

  def scottcare_count
#    if !device_locations.empty?
#      device_locations.first.location.devices.where( "device_type_id = 9 AND `device_locations`.`active` = 1" ).count
#    else
#      return 0
#    end

    if !device_assignments.empty?
      device_assignments.first.location.devices.where( "`devices`.`device_type_id` = 9 AND `device_assignments`.`returned_date` IS NULL and start_date IS NOT NULL" ).count
    else
      return 0
    end
  end

  def event_count
#    if !device_locations.empty?
#      device_locations.first.location.devices.where( "device_type_id = 2 AND `device_locations`.`active` = 1" ).count
#    else
#      return 0
#    end

    if !device_assignments.empty?
      device_assignments.first.location.devices.where( "`devices`.`device_type_id` = 2 AND `device_assignments`.`returned_date` IS NULL and start_date IS NOT NULL" ).count
    else
      return 0
    end
  end

end

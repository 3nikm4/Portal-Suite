class ReportsController < ApplicationController
  layout "reports"

  # reports/all_locations_summary
  def all_locations_summary
    @locations = Location.where( :active => TRUE ).order("location_name ASC")
  end
  
  # reports/device_problems
  def problematic_devices
    @devices = DeviceProblem.order( "created_at DESC" )
  end
  
  # reports/devices_in_use
  def devices_in_use
    @device_assignments = DeviceAssignment.joins(:device).where( " `device_assignments`.`patient_id` IS NOT NULL and `device_assignments`.`returned_date` IS NULL " ).order( "`devices`.`serial_number` ASC" )
  end
  
  # reports/location_status/:id
  def location_summary
    @location = Location.find(params[:id])
  end

  # reports/unreturned_devices
  def unreturned_devices
    @device_assignments = DeviceAssignment.where( " patient_id IS NOT NULL AND returned_date IS NULL AND end_date < CURDATE()" ).order( "end_date DESC" )
  end

  # reports/onsite_devices
  def onsite_devices
    @results = DeviceAssignment.joins(:location).where( " `device_assignments`.`returned_date` IS NULL AND location_id IS NOT NULL" ).order("`locations`.`location_name` ASC")
  end

  # reports/rma_devices
  def rma_devices
    @devices = Device.where( :device_status_id => 10)
  end

  # reports/last_known_location
  def last_known_location
    @sql = " SELECT "
    @sql += " temp.serial_number, "
    @sql += "	temp.device_type as 'device_type', "
    @sql += "	temp.device_status as 'device_status', "
    @sql += "	temp.start_date, "
    @sql += "	temp.end_date, "
    @sql += "	temp.location_name, "
    @sql += "	CONCAT(temp.first_name, ' ', temp.last_name) as 'patient_name' "
    @sql += " FROM ("
    @sql += "	SELECT devices.serial_number, "
    @sql += "	device_types.device_type, "
    @sql += "	device_statuses.device_status, "
    @sql += "	device_assignments.start_date, "
    @sql += "	device_assignments.end_date, "
    @sql += "	device_assignments.returned_date, "
    @sql += "	locations.location_name, "
    @sql += "	patients.first_name, "
    @sql += "	patients.last_name"
    @sql += "	FROM  device_assignments "
    @sql += "	LEFT JOIN devices ON device_assignments.device_id = devices.id "
    @sql += "	LEFT JOIN device_statuses ON devices.device_status_id = device_statuses.id "
    @sql += "	LEFT JOIN device_types ON devices.device_type_id = device_types.id "
    @sql += "	LEFT JOIN patients ON device_assignments.patient_id = patients.id "
    @sql += "	LEFT JOIN locations ON device_assignments.location_id = locations.id "
    @sql += "	ORDER BY device_assignments.start_date DESC, devices.serial_number ASC "
    @sql += ") AS temp "
    @sql += "GROUP BY temp.serial_number"
    @results = DeviceAssignment.find_by_sql(@sql)
  end

  # reports/inventory_and_assignments
  def inventory_and_assignments
    @sql = "SELECT "
    @sql += "temp.serial_number, " 
    @sql += "temp.device_type, "
    @sql += "temp.device_status, "
    @sql += "temp.start_date, "
    @sql += "temp.end_date, "
    @sql += "temp.patient_name, "
    @sql += "temp.location_name "
    @sql += "FROM ( "
    @sql += "	SELECT "
    @sql += "		devices.serial_number, "
    @sql += "		device_types.device_type, "
    @sql += "		device_statuses.device_status, "
    @sql += "		device_assignments.start_date, " 
    @sql += "		device_assignments.end_date, "
    @sql += "		CONCAT(patients.last_name, ', ', patients.first_name) as 'patient_name', "
    @sql += "		locations.location_name "
    @sql += "	FROM "
    @sql += "		devices "
    @sql += "		INNER JOIN device_types ON devices.device_type_id = device_types.id "
    @sql += "		INNER JOIN device_statuses ON devices.device_status_id = device_statuses.id "
    @sql += "		LEFT JOIN device_assignments ON device_assignments.device_id = devices.id "
    @sql += "		LEFT JOIN patients ON device_assignments.patient_id = patients.id "
    @sql += "		LEFT JOIN locations ON device_assignments.location_id = locations.id "
    @sql += "	WHERE "
    @sql += "	  devices.device_type_id <> 3 AND "
    @sql += "		devices.device_type_id <> 4 AND "
    @sql += "		devices.device_type_id <> 5 AND "
    @sql += "		devices.device_type_id <> 6 AND "
    @sql += "		devices.device_type_id <> 7 AND "
    @sql += "		devices.device_type_id <> 8 AND " 
    @sql += "		devices.device_status_id <> 10"
    @sql += ") as temp"
    @sql += "GROUP BY temp.serial_number"
    @results = Device.find_by_sql(@sql)
  end

  # reports/full_inventory
  def full_inventory
    @er920 = Device.where( "device_type_id = 2" ).count
    @fusion = Device.where( "device_type_id = 1" ).count
    @telesentry = Device.where( "device_type_id = 9" ).count
    @results = Device.where( "device_status_id <> 10 AND device_type_id <> 3 AND device_type_id <> 4 AND device_type_id <> 5 AND device_type_id <> 6 AND device_type_id <> 7 AND device_type_id <> 8" ).order( "serial_number ASC" )
  end

end

class CreateDeviceAssignments < ActiveRecord::Migration
  def change
    create_table :device_assignments do |t|

      t.integer :device_id
      t.integer :patient_id
      t.integer :location_id
      t.date :start_date
      t.date :end_date
      t.date :returned_date
      t.integer :monitor_length

      t.timestamps
    end
  end
end

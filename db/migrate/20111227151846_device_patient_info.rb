class DevicePatientInfo < ActiveRecord::Migration
  def change
    create_table :device_patients do |t|
      t.integer :device_id
      t.integer :patient_id
      t.date :monitor_start
      t.date :monitor_end
      
      t.timestamps
    end
  end

  def down
  end
end

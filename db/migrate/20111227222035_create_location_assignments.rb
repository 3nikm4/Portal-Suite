class CreateLocationAssignments < ActiveRecord::Migration
  def change
    create_table :location_assignments do |t|
      t.integer :location_id
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

class CreatePatientAssignments < ActiveRecord::Migration
  def change
    create_table :patient_assignments do |t|
      t.integer :patient_id
      t.integer :device_id
      t.date :montior_start
      t.date :monitor_end

      t.timestamps
    end
  end
end

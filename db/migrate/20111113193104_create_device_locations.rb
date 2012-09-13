class CreateDeviceLocations < ActiveRecord::Migration
  def change
    create_table :device_locations, :id => false do |t|
      t.integer :location_id
      t.integer :device_id
      t.integer :patient_id
      t.date :active_on
      t.date :finished_on

      t.timestamps
    end
  end
end

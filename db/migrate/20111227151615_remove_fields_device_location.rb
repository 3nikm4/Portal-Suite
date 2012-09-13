class RemoveFieldsDeviceLocation < ActiveRecord::Migration
  def up
    remove_column :device_locations, :patient_id
    remove_column :device_locations, :active_on
    remove_column :device_locations, :finished_on
  end

  def down
    add_column :device_locations, :patient_id, :integer
    add_column :device_locations, :active_on, :date
    add_column :device_locations, :finished_on, :date
  end
end

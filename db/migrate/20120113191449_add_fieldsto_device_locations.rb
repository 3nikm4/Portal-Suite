class AddFieldstoDeviceLocations < ActiveRecord::Migration
  def up
    add_column :device_locations, :active, :boolean
  end

  def down
    remove_column :device_locations, :active
  end
end

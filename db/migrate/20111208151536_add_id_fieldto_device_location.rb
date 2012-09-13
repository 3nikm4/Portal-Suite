class AddIdFieldtoDeviceLocation < ActiveRecord::Migration
  def up
    add_column :device_locations, :id, :primary_key
  end

  def down
    remove_column :device_locations, :id
  end
end

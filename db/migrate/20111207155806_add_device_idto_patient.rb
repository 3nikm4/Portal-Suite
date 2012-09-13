class AddDeviceIdtoPatient < ActiveRecord::Migration
  def up
    add_column :patients, :device_id, :integer
  end

  def down
    remove_column :patients, :device_id
  end
end

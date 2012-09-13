class AddCarrier2Devices < ActiveRecord::Migration
  def up
    add_column :devices, :device_carrier_id, :integer
  end

  def down
    remove_column :devices, :device_carrier_id
  end
end

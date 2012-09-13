class CreateDeviceBatteries < ActiveRecord::Migration
  def change
    create_table :device_batteries do |t|
      t.integer :device_id
      t.string :device_battery_serial

      t.timestamps
    end
  end
end

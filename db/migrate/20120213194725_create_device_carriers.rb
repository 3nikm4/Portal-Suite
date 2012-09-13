class CreateDeviceCarriers < ActiveRecord::Migration
  def change
    create_table :device_carriers do |t|
      t.string :device_carrier

      t.timestamps
    end
  end
end

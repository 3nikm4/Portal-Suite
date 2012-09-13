class CreateDeviceStatuses < ActiveRecord::Migration
  def change
    create_table :device_statuses do |t|
      t.string :device_status

      t.timestamps
    end
  end
end

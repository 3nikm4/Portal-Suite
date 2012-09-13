class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.integer :device_status_id
      t.integer :device_type_id
      t.string :serial_number
      t.string :asset_tag
      t.text :comment
      t.string :imsi
      t.string :iccid

      t.timestamps
    end
  end
end

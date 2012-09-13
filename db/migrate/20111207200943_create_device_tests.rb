class CreateDeviceTests < ActiveRecord::Migration
  def change
    create_table :device_tests do |t|
      t.integer :device_id
      t.boolean :tom24
      t.boolean :forced
      t.boolean :enrolled
      t.boolean :completed

      t.timestamps
    end
  end
end

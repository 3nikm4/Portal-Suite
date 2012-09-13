class RemoveUnusedTables < ActiveRecord::Migration

  def up
    drop_table :device_patients
  end

  def down
  end

end

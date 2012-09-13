class RemoveLocationAssignments < ActiveRecord::Migration
  def up
    drop_table :location_assignments
  end

  def down
  end
end

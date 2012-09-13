class ChangeCallTypetoDirection < ActiveRecord::Migration
  def up
    rename_column :calls, :call_type, :call_direction
  end

  def down
    rename_column :calls, :call_direction, :call_type
  end
end

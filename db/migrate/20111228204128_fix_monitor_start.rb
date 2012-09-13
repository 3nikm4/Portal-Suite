class FixMonitorStart < ActiveRecord::Migration
  def change
    rename_column :patient_assignments, :montior_start, :monitor_start
  end

  def down
  end
end

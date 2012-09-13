class AddActivetoPatientAssignments < ActiveRecord::Migration
  def up
    add_column :patient_assignments, :active, :boolean
  end

  def down
    remove_column :patient_assignments, :active
  end
end

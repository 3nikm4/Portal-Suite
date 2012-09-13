class AddReturnedDatetoPatientAssignment < ActiveRecord::Migration
  def up
    add_column :patient_assignments, :returned_date, :date
  end

  def down
    remove_column :patient_assignments, :returned_date
  end
end

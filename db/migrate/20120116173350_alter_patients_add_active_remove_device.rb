class AlterPatientsAddActiveRemoveDevice < ActiveRecord::Migration
  def up
    remove_column :patients, :device_id
    add_column :patients, :active, :boolean
  end

  def down
    add_column :patients, :device_id, :integer
    remove_column :patients, :active
  end
end

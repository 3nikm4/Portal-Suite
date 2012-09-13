class AddActivetoDeviceLocation < ActiveRecord::Migration
  def up
    add_column :locations, :active, :boolean
  end

  def down
    remove_column :locations, :active
  end
end

class RemoveActiveFromLocation < ActiveRecord::Migration
  def up
    remove_column :locations, :active
  end

  def down
    add_column :locations, :active, :boolean
  end
end

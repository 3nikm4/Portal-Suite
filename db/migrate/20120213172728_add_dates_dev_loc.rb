class AddDatesDevLoc < ActiveRecord::Migration
  def up
    remove_column :locations, :arrival_date
    remove_column :locations, :depart_date
    add_column :device_locations, :arrival_date, :date
    add_column :device_locations, :depart_date, :date
  end

  def down
    remove_column :device_locations, :arrival_date
    remove_column :device_locations, :depart_date
  end
end

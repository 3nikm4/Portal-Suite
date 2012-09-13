class AddDatestoLocation < ActiveRecord::Migration
  def up
    add_column :locations, :arrival_date, :date
    add_column :locations, :depart_date, :date
  end

  def down
    remove_column :locations, :arrival_date
    remove_column :locations, :depart_date
  end
end

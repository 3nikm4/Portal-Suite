class AddScottcarePartoLocations < ActiveRecord::Migration
  def up
    add_column :locations, :par_level_scottcare, :integer
  end

  def down
    remove_column :locations, :par_level_scottcare
  end
end

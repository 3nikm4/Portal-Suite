class CreateUserLocations < ActiveRecord::Migration
  def change
    create_table :user_locations do |t|

      t.string :location_name

      t.timestamps
    end
  end
end

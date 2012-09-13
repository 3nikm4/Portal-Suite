class CreateCallLocations < ActiveRecord::Migration
  def change
    create_table :call_locations do |t|
      t.string :call_location

      t.timestamps
    end
  end
end

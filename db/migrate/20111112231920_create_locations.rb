class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.integer :practice_id
      t.integer :location_type_id
      t.string :location_name
      t.string :location_street1
      t.string :location_street2
      t.string :location_city
      t.string :location_state
      t.string :location_zip
      t.string :location_contact
      t.integer :par_level_event
      t.integer :par_level_mct
      t.integer :alert_amount
      t.boolean :active

      t.timestamps
    end
  end
end

class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.integer :location_id
      t.string :first_name
      t.string :last_name
      t.string :address_street1
      t.string :address_street2
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.date :dob

      t.timestamps
    end
  end
end

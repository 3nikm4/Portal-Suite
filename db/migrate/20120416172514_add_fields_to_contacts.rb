class AddFieldsToContacts < ActiveRecord::Migration
  def up
    add_column :contacts, :dob, :date
    add_column :contacts, :device_serial, :string

  end

  def down
    remove_column :contacts, :dob
    remove_column :contacts, :device_serial
  end
end

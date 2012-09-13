class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|

      t.string :first_name

      t.string :last_name

      # contact_type relation
        # patient, doc / nurse, other
      t.integer :contact_type_id

      t.timestamps
    end
  end
end

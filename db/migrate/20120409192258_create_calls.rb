class CreateCalls < ActiveRecord::Migration
  def change
    create_table :calls do |t|
      t.integer :user_id
      t.datetime :call_start
      t.datetime :call_end
      t.string :call_reason
      t.string :call_notes
      t.integer :call_location_id
      t.integer :call_type_id
      t.integer :contact_id
      t.integer :contact_type_id

      t.timestamps
    end
  end
end

class CreateAudits < ActiveRecord::Migration
  def change
    create_table :audits do |t|
      t.integer :user_id
      t.integer :device_id
      t.string :action
      t.string :webpage

      t.timestamps
    end
  end
end

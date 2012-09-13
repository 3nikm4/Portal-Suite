class CreateDeviceProblems < ActiveRecord::Migration
  def change
    create_table :device_problems do |t|
      t.integer :device_id
      t.string :device_problem
      t.text :comment
      t.integer :device_problem_status_id

      t.timestamps
    end
  end
end

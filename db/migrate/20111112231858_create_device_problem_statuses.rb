class CreateDeviceProblemStatuses < ActiveRecord::Migration
  def change
    create_table :device_problem_statuses do |t|
      t.string :device_problem_status

      t.timestamps
    end
  end
end

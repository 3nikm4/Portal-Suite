class CreateAccessLevels < ActiveRecord::Migration
  def change
    create_table :access_levels do |t|

      t.timestamps
    end
  end
end

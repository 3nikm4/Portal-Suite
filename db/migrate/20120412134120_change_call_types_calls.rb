class ChangeCallTypesCalls < ActiveRecord::Migration

  def up
    change_table :calls do |t|
      t.change :call_type_id, :boolean
      t.rename :call_type_id, :call_type 
    end
  end

  def down
    change_table :calls do |t|
      t.change :call_type, :integer
      t.rename :call_type, :call_type_id 
    end
  end

end

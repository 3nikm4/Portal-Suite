class ChangeCallsAddCallType < ActiveRecord::Migration
  def up
    add_column :calls, :call_type_id, :integer
  end

  def down
     remove_column :call, :call_type_id
  end
end

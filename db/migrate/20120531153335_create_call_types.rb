class CreateCallTypes < ActiveRecord::Migration
  def change
    create_table :call_types do |t|
      t.string :call_type

      t.timestamps
    end
  end
end

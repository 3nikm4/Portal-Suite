class CreateDisposableTypes < ActiveRecord::Migration
  def change
    create_table :disposable_types do |t|
      t.string :disposable_type

      t.timestamps
    end
  end
end

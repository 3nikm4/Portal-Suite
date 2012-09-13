class CreateDisposables < ActiveRecord::Migration
  def change
    create_table :disposables do |t|
      t.integer :disposable_type_id
      t.integer :location_id
      t.integer :amount
      t.integer :par_level
      t.integer :alert_amount

      t.timestamps
    end
  end
end

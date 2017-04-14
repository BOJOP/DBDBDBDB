class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      
      t.references :section, null: false
      t.references :time_slot, null: false

      t.timestamps
    end
  end
end

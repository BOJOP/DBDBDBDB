class CreateTimeSlots < ActiveRecord::Migration[5.0]
  def change
    create_table :time_slots do |t|
      
      t.string :day, null: false
      t.time :start, null: false
      t.time :end, null: false

      t.timestamps
    end
  end
end

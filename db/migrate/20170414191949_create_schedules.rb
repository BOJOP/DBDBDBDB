class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|

      t.references :section, null: false
      t.references :time_slot, null: false

      t.timestamps
    end

    add_foreign_key :schedules, :sections, on_delete: :cascade, on_update: :cascade
    add_foreign_key :schedules, :time_slots

  end
end

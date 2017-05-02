class CreateParticipates < ActiveRecord::Migration[5.0]
  def change
    create_table :participates do |t|

			t.references :group, null: false
			t.references :event, null: false

			t.string :position
			t.integer :duration

      t.timestamps
    end

    add_foreign_key :participates, :groups, on_delete: :cascade, on_update: :cascade
    add_foreign_key :participates, :events, on_delete: :cascade, on_update: :cascade

  end
end

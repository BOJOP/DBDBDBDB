class CreateLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :leaves do |t|

      t.date :start_date, null: false
      t.date :end_date, null: false

      t.references :group, null: false

      t.timestamps
    end

    add_foreign_key :leaves, :groups, on_delete: :cascade, on_update: :cascade

  end
end

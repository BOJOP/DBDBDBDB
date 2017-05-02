class CreateSickLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :sick_leaves do |t|

      t.string :reason, null: false

      t.references :leave, null: false

      t.timestamps
    end

    add_foreign_key :sick_leaves, :leaves, on_delete: :cascade, on_update: :cascade

  end
end

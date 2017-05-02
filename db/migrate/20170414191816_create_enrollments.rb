class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|

      t.float :grade

      t.references :section, null: false
      t.references :student, null: false

      t.timestamps
    end

		change_column :enrollments, :student_id, :string

    add_foreign_key :enrollments, :students, on_delete: :cascade, on_update: :cascade
    add_foreign_key :enrollments, :sections, on_update: :cascade
  end
end

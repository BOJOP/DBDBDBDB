class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|

      t.float :grade
      
      t.references :section, null: false
      t.references :student, null: false
      
      t.timestamps
    end
		
		change_column :enrollments, :student_id, :string
  end
end

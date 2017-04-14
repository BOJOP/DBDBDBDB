class CreateEnrollments < ActiveRecord::Migration[5.0]
  def change
    create_table :enrollments do |t|

      t.integer :grade
      
      t.references :section, null: false
      t.references :student, null: false
      
      t.timestamps
    end
  end
end
class CreateGpas < ActiveRecord::Migration[5.0]
  def change
    create_table :gpas do |t|

      t.integer :year, null: false
      t.integer :semester, null: false
      t.integer :credit, null: false
      t.float :gpa
      
      t.references :student, null: false
      
      t.timestamps
    end
			
		change_column :gpas, :student_id, :string

  end
end

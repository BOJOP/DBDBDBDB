class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.string :ssn
      t.date :birth_date
      t.string :gender
      t.integer :enroll_year
      t.string :status
     
      t.string :email, null: false
      
      t.references :curriculum, null: false

      t.timestamps
    end
  end
end

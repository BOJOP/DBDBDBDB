class CreatePersonnels < ActiveRecord::Migration[5.0]
  def change
    create_table :personnels do |t|
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.string :ssn
      t.date :birth_date
      t.string :gender
      t.string :role, null: false
      
      t.string :email, null: false
      t.string :password_digest
      t.string :remember_digest
      
      t.integer :manage_department_id
      t.integer :workin_department_id

      t.timestamps
    end

    add_index :personnels, :email, unique: true
  end
end

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

      t.references :manage_department, null: true
      t.references :workin_department, null: true

      t.timestamps
    end

    add_index :personnels, :email, unique: true

    add_foreign_key :personnels, :departments, column: :manage_department_id, primary_key: :id, on_delete: :nullify, on_update: :cascade
    add_foreign_key :personnels, :departments, column: :workin_department_id, primary_key: :id, on_delete: :nullify, on_update: :cascade
  end
end

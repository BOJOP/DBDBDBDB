class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false

      t.references :department, null: false
      t.references :course_category, null: false

      t.integer :credit

      t.timestamps
    end
  end
end

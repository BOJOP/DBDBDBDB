class CreateCourseCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :course_categories do |t|
      t.string :code, null: false
      t.string :category, null: false

      t.timestamps
    end
  end
end

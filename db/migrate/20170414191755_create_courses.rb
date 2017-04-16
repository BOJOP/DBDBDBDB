class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false

      t.references :code, null: false

      t.integer :credit

      t.timestamps
    end
  end
end

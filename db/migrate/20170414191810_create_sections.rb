class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.integer :sec, null: false
      t.integer :year, null: false
      t.integer :semester, null: false

      t.references :course, null: false

      t.timestamps
    end
    add_foreign_key :sections, :courses, on_delete: :cascade, on_update: :cascade

  end
end

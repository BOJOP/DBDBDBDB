class CreateCurriculums < ActiveRecord::Migration[5.0]
  def change
    create_table :curriculums do |t|
      t.string :name, null: false
      t.string :description

      t.references :department, null: false

      t.timestamps
    end

    add_foreign_key :curriculums, :departments, on_delete: :cascade, on_update: :cascade
  end
end

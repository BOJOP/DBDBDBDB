class CreateRequires < ActiveRecord::Migration[5.0]
  def change
    create_table :requires do |t|

      t.references :curriculum, null: false
      t.references :course, null: false

      t.timestamps
    end

    add_foreign_key :requires, :curriculums, on_delete: :cascade, on_update: :cascade
    add_foreign_key :requires, :courses, on_delete: :cascade, on_update: :cascade

  end
end

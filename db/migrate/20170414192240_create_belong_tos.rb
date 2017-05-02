class CreateBelongTos < ActiveRecord::Migration[5.0]
  def change
    create_table :belong_tos do |t|

      t.references :student, null: false
      t.references :group, null: false
      t.timestamps
    end

		change_column :belong_tos, :student_id, :string

    add_foreign_key :belong_tos, :students, on_delete: :cascade, on_update: :cascade
    add_foreign_key :belong_tos, :groups, on_delete: :cascade, on_update: :cascade
  end
end

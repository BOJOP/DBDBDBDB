class CreateCodes < ActiveRecord::Migration[5.0]
  def change
    create_table :codes do |t|
			t.string :category

			t.references :department, null: false

      t.timestamps
    end
    add_foreign_key :codes, :departments, on_delete: :cascade, on_update: :cascade

  end
end

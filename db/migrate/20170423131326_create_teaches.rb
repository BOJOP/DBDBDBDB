class CreateTeaches < ActiveRecord::Migration[5.0]
  def change
    create_table :teaches do |t|

			t.references :personnel, null: false
			t.references :section, null: false

      t.timestamps
    end

    add_foreign_key :teaches, :personnels, on_delete: :cascade, on_update: :cascade
    add_foreign_key :teaches, :sections, on_delete: :cascade, on_update: :cascade

  end
end

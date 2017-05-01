class CreateLogBreaks < ActiveRecord::Migration[5.0]
  def change
    create_table :log_breaks do |t|

      t.string :remark
      t.datetime :when, null: false

      t.references :rule, null: false
      t.references :student, null: false


      t.timestamps
    end

		change_column :log_breaks, :student_id, :string

  end
end

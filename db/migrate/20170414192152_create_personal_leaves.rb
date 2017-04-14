class CreatePersonalLeaves < ActiveRecord::Migration[5.0]
  def change
    create_table :personal_leaves do |t|

      t.string :project_name, null: false
      
      t.references :leave, null: false

      t.timestamps
    end
  end
end

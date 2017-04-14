class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.integer :sec, null: false
      t.integer :year, null: false
      t.integer :semester, null: false
      
      t.references :course, null: false
      t.references :personnel
      
      t.timestamps
    end
  end
end

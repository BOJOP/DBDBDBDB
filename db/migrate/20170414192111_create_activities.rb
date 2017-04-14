class CreateActivities < ActiveRecord::Migration[5.0]
  def change
    create_table :activities do |t|
      
      t.string :position, null: false
      t.integer :duration, null: false
      
      t.references :portfolio, null: false

      t.timestamps
    end
  end
end

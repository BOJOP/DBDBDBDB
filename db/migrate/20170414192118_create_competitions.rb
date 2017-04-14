class CreateCompetitions < ActiveRecord::Migration[5.0]
  def change
    create_table :competitions do |t|
    
      t.string :award, null: false
      
      t.references :portfolio, null: false

      t.timestamps
    end
  end
end
